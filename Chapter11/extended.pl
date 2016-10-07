#!/usr/bin/perl
# extended.pl (p351)
use warnings;
use strict;

my $text= "Testing";
if ($text =~ /((?:T|N)est(ing|er))/) {
    print " \$1 = $1 \n \$2 = $2 \n \$3 = $3 \n \$4 = $4 \n";
}
