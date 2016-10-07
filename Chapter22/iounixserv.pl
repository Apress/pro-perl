#!/usr/bin/perl 
# iounixserv.pl (p931)
use warnings;
use strict;

use IO::Socket;

my $file = '/tmp/unixserv_socket';

# remove previous socket file, if present
unlink $file;

my $server = IO::Socket->new(
   Domain    => PF_UNIX,
   Type      => SOCK_STREAM,
   Local     => $file,
   Listen    => 5,
);

die "Could not bind: $!\n" unless $server;

print "Server running on file $file...\n";
while (my $connection = $server->accept) {
    print $connection "You're connected to the server!\n";
    while (<$connection>) {
        print "Client says: $_";
    }
    close $connection;
}
