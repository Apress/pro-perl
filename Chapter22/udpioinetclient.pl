#!/usr/bin/perl 
# udpioinetclient.pl (p929)
use warnings;
use strict;

use IO::Socket;

my $host = 'localhost';
my $port = 4444;

my $client = new IO::Socket(
    Domain   => PF_INET,
    Proto    => 'udp',
);

die "Unable to create socket: $!\n" unless $client;

my $servaddr = sockaddr_in($port, inet_aton($host));
$client->send("Hello from client", 0, $servaddr)
    or die "Send: $!\n";
my $message;
$client->recv($message, 1024, 0);
print "Response was: $message\n";
