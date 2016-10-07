#!/usr/bin/perl 
# listfldhost.pl (p946-947)
use warnings;
use strict;

use Net::hostent qw(:FIELDS);
use Socket qw(inet_ntoa);

my @hosts;
while (my $host = CORE::gethostent) {
    push @hosts, $host;
}

while (my $host = shift @hosts) {
    $host = gethostbyname($host);
    print 'Name     : ', $h_name, "\n";
    print 'Type     : ', $h_addrtype, "\n";
    print 'Length   : ', $h_length, " bytes\n";
    print 'Aliases  : ', join(', ', @h_aliases), "\n";
    print 'Addresses: ', join(', ', map{inet_ntoa($_)} @h_addr_list), "\n\n";
}
