#!/usr/bin/perl
# overwrite1.pl (p352)
use warnings;
use strict;

my $text = "one:two:three:four:five";
# match noncolon characters optionally followed by a colon, 3 times
if ($text =~ /(([^:]+):?){3}/) {
    print " \$1 = $1 \n \$2 = $2 \n";
}
