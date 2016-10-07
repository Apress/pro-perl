#!/usr/bin/perl 
# iounixclnt.pl (p932-933)
use warnings;
use strict;

use IO::Socket;

my $file = '/tmp/unixserv_socket';

my $server = IO::Socket->new(
    Domain   => PF_UNIX,
    Type     => SOCK_STREAM,
    Peer     => $file,
);

die "Connect failed: $!\n" unless $server;

# communicate with the server
print "Client connected.\n";
print "Server says: ", scalar(<$server>);
print $server "Hello from the client!\n";
print $server "And goodbye!\n";
close $server;
