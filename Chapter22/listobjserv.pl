#!/usr/bin/perl
# listobjserv.pl (p942)
use warnings;
use strict;

use Net::servent;

while (my $service = getservent) {
    print 'Name : ', $service->name, "\n";
    print 'Port No: ', $service->port, "\n";
    print 'Protocol: ', $service->proto, "\n";
    print 'Aliases: ', join(', ', @{$service->aliases}), "\n\n";
}

