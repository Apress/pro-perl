#!/usr/bin/perl -w
# switchonsub.pl (p184)
use strict;
use Switch;

my $input;

sub lessthan { $input < $_[0] };

$input=int(<>);
switch ( \&lessthan ) {
    case 10           { print "less than 10\n" }
    case (100-$input) { print "less than 50\n" }
    case 100          { print "less than 100\n" }
}
