#!/usr/bin/perl
# overwrite2.pl (p352)
use warnings;
use strict;

my $text = "one:two:three:four:five";
# match noncolon characters optionally followed by a colon, 3 times

if ($text =~ /^(([^:]+):?)(([^:]+):?)(([^:]+):?)/) {
    print " \$2 = $2 \n \$4 = $4 \n \$6 = $6 \n";
}
