#!/usr/bin/perl 
# udpinetclient.pl (p928)
use warnings;
use strict;

use Socket;

my $proto = getprotobyname('udp');
my $host  = inet_aton('localhost');
my $port  = 4444;

# Create a socket for sending & receiving on
socket CLIENT, PF_INET, SOCK_DGRAM, $proto
    or die "Unable to create socket: $!";

# Create 'sockaddr_in' structure to connect to the given
# port on the IP address for the remote host
my $servaddr = sockaddr_in($port, $host);

# communicate with the server
send CLIENT, "Hello from client", 0, $servaddr or die "Send: $!\n";
my $message;
recv CLIENT, $message, 1024, 0;
print "Response was: $message\n";
