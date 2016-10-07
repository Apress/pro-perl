#!/usr/bin/perl 
# listobjhost.pl (p946)
use warnings;
use strict;

use Net::hostent;
use Socket qw(inet_ntoa);

my @hosts;
while (my $host = gethostent) {
    push @hosts, $host;
}

while (my $host = shift @hosts) {
    $host = gethostbyname($host);
    print 'Name     : ', $host->name, "\n";
    print 'Type     : ', $host->addrtype, "\n";
    print 'Length   : ', $host->length, " bytes\n";
    print 'Aliases  : ', join(', ', @{$host->aliases}), "\n";
    print 'Addresses: ', join(', ', map {inet_ntoa($_)} 
        @{$host->addr_list}), "\n\n";
}
