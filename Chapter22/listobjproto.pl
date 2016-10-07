#!/usr/bin/perl
# listobjproto.pl (p951)
use warnings;
use strict;

use Net::protoent;

while (my $protocol = getprotoent) {
    print "Protocol: ", $protocol->proto, "\n";
    print "Name : ", $protocol->name, "\n";
    print "Aliases : ", join(', ', @{$protocol->aliases}), "\n\n";
}
