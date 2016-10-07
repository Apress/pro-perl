#!/usr/bin/perl 
# getfldnet.pl (p948-949)
use warnings;
use strict;

use Net::netent qw(:FIELDS);
use Socket qw(inet_ntoa);

my @nets;
while (my $net = CORE::getnetent) {
    push @nets, $net;
}

while (my $net = shift @nets) {
    $net = getnetbyname($net);
    print 'Name     : ', $n_name, "\n";
    print 'Type     : ', $n_addrtype, "\n";
    print 'Aliases  : ', join(', ', @n_aliases), "\n";
    print 'Number   : ', $n_net, "\n\n";
}
