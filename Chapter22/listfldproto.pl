#!/usr/bin/perl
# listfldproto.pl (p952)
use warnings;
use strict;

use Net::protoent qw(:FIELDS);

while (my $protocol = getprotoent) {
    print "Protocol: ", $p_proto, "\n";
    print "Name : ", $p_name, "\n";
    print "Aliases : ", join(', ', @p_aliases), "\n\n";
}
