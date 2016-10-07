#!/usr/bin/perl 
# tcpioinetclient.pl (p924,p925)
use warnings;
use strict;

use IO::Socket;

my $host = 'localhost'; 
my $port = 4444;

# (<p924)
#my $server = IO::Socket->new(
#    Domain   => PF_INET,
#    Proto    => 'tcp',
#    PeerAddr => $host,
#    PeerPort => $port,
#);

# (>p925)
my $server = new IO::Socket::INET(
    Proto => 'tcp',
    PeerAddr => $host,
    PeerPort => $port,
);

# my $server = new IO::Socket::INET("$host:$port");

die "Connect failed: $!\n" unless $server;

# communicate with the server
print "Client connected.\n";
print "Server says: ", scalar(<$server>);
print $server "Hello from the client!\n";
print "Server says: ", scalar(<$server>);
print $server "And goodbye!\n";
print "Server says: ", scalar(<$server>);
close $server;
