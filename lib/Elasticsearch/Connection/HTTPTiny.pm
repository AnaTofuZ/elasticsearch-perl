package Elasticsearch::Connection::HTTPTiny;

use strict;
use warnings;
use namespace::autoclean;
use parent 'Elasticsearch::Connection';
use HTTP::Tiny();
use Elasticsearch::Error qw(throw);
use Elasticsearch::Util qw(code_to_error);

my $Connection_Error = qr/ Connection.(?:timed.out|re(?:set|fused))
                       | connect:.timeout
                       | Host.is.down
                       | No.route.to.host
                       | temporarily.unavailable
                       /x;

#===================================
sub perform_request {
#===================================
    my ( $self, $node, $params ) = @_;

    my $method = $params->{method};
    my $uri = $self->http_uri( $node, $params->{path}, $params->{qs} );

    my %args;
    if ( exists $params->{body} ) {
        $args{content} = $self->serializer->encode( $params->{body} );
        $args{headers}{'Content-Type'} = $self->mime_type;
    }

    my $response = $self->handle($node)->request( $method, "$uri", \%args );

    my $code = $response->{status};
    my $msg  = $response->{reason};
    my $body = $response->{content} || '';
    my $ce   = $response->{headers}{'content-encoding'} || '';

    $body = $self->inflate($body) if $ce eq 'deflate';
    return $body if $code && $code >= 200 && $code <= 209;

    if ( $code eq '599' ) {
        $msg  = $body;
        $body = '';
    }

    my $type = code_to_error($code)
        || (
          $msg =~ /Timed out/         ? 'Timeout'
        : $msg =~ /$Connection_Error/ ? 'Connection'
        :                               'Request'
        );

    chomp $msg;
    throw( $type, "$msg ($code)",
        { code => $code, body => $body, error => $msg } );
}

#===================================
sub handle {
#===================================
    my $self = shift;
    unless ( $self->{_handle}{$$} ) {
        my %args = (
            default_headers => $self->default_headers,
            timeout         => $self->timeout,
        );
        if ( $self->https ) {
            require IO::Socket::SSL;
            $args{SSL_options}
                = { SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE() };
        }
        my $tiny = HTTP::Tiny->new( %args, %{ $self->handle_params } );
        $self->{_handle} = { $$ => $tiny };
    }
    return $self->{_handle}{$$};
}

1;