#!/usr/bin/perl
# listfldserv.pl (p942-943)
use warnings;
use strict;

use Net::servent qw(:FIELDS);

while (my $service = getservent) {
    print 'Name : ', $s_name, "\n";
    print 'Port No: ', $s_port, "\n";
    print 'Protocol: ', $s_proto, "\n";
    print 'Aliases: ', join(', ', @s_aliases), "\n\n";
}
