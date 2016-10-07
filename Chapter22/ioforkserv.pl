#!/usr/bin/perl 
# ioforkserv.pl (p938-939)
use warnings;
use strict;

use IO::Socket;

$| = 1;               # autoflush on
$SIG{CHLD}='IGNORE';  # tell OS to clean up dead children

my $port = 4444;

my $server = IO::Socket->new(
    Domain    => PF_INET,
    Proto     => 'tcp',
    LocalPort => $port,
    Listen    => SOMAXCONN,
    Reuse     => 1,
);

die "Bind failed: $!\n" unless $server;

print "Multiplex server running on port $port...\n";
while (my $connection = $server->accept) {
    my $name = $connection->peerhost;
    my $port = $connection->peerport;
    if (my $pid = fork) {
        close $connection;
        print "Forked child $pid for new client $name:$port\n";
        next;   # on to the next connection
    } else {
        # child process ? handle connection
        print $connection "You're connected to the server!\n";
        while (<$connection>) {
            print "Client $name:$port says: $_";
            print $connection "Message received OK\n";
        }
        print "Client $name:$port disconnected\n";
        $connection->shutdown(SHUT_RDWR);
    }
}
