#!/usr/bin/perl -w
# sudo iptables -I OUTPUT -o lo -p tcp --dport 8080 -j ACCEPT
use warnings;
use strict;

{
package KV::Server;
use base qw(HTTP::Server::Simple::CGI);

sub handle_request {
  print "HTTP/1.0 200 OK\r\n";
  print "Content-type: text/plain\n";
  print "\n";
  open( Z, "<meng.txt") || die "cannot open $!";
  while (<Z>) { print }
  close Z;
}
}

KV::Server->new(8080)->run();
