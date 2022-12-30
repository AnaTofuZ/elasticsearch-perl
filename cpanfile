requires "Any::URI::Escape" => "0";
requires "AnyEvent::HTTP" => "0";
requires "AnyEvent::TLS" => "0";
requires "Data::Dumper" => "0";
requires "Devel::GlobalDestruction" => "0";
requires "Encode" => "0";
requires "File::Temp" => "0";
requires "File::Util::Tempdir" => "0";
requires "HTTP::Headers" => "0";
requires "HTTP::Parser::XS" => "0";
requires "HTTP::Request" => "0";
requires "HTTP::Tiny" => "0.076";
requires "IO::Compress::Deflate" => "0";
requires "IO::Compress::Gzip" => "0";
requires "IO::Uncompress::Unzip" => "0";
requires "IO::Select" => "0";
requires "IO::Socket" => "0";
requires "IO::Uncompress::Gunzip" => "0";
requires "IO::Uncompress::Inflate" => "0";
requires "JSON::MaybeXS" => "1.002002";
requires "JSON::PP" => "0";
requires "LWP::UserAgent" => "0";
requires "List::Util" => "0";
requires "Log::Any" => "1.02";
requires "Log::Any::Adapter" => "0";
requires "MIME::Base64" => "0";
requires "Module::Runtime" => "0";
requires "Moo" => "2.001000";
requires "Moo::Role" => "0";
requires "Net::Curl::Easy" => "0";
requires "Net::IP" => "0";
requires "POSIX" => "0";
requires "Package::Stash" => "0.34";
requires "Promises" => "0.93";
requires "Scalar::Util" => "0";
requires "Sub::Exporter" => "0";
requires "Time::HiRes" => "0";
requires "Try::Tiny" => "0";
requires "URI" => "0";
requires "namespace::clean" => "0";
requires "overload" => "0";
requires "parent" => "0";
requires "strict" => "0";
requires "warnings" => "0";
recommends "URI::Escape::XS" => "0";

on 'test' => sub {
  requires "AE" => "0";
  requires "Array::Utils" => "0";
  requires "EV" => "0";
  requires "IO::Socket::SSL" => "0";
  requires "JSON::XS" => "0";
  requires "Log::Any::Adapter::Callback" => "0.09";
  requires "Path::Class" => "0";
  requires "Perl::Tidy" => "0";
  requires "TAP::Harness::JUnit" => "0";
  requires "Test::Deep" => "0";
  requires "Test::EOL" => "0";
  requires "Test::Exception" => "0";
  requires "Test::More" => "0.98";
  requires "Test::NoTabs" => "0";
  requires "Test::SharedFork" => "0";
  requires "YAML" => "0";
  requires "YAML::XS" => "0";
  requires "base" => "2.18";
  requires "lib" => "0";
};

on 'test' => sub {
  recommends "Cpanel::JSON::XS" => "0";
  recommends "JSON::XS" => "2.26";
  recommends "Mojo::IOLoop" => "0";
  recommends "Mojo::UserAgent" => "0";
};
