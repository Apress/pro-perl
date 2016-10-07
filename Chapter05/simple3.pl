#!/usr/bin/perl
# simple3.pl (p150-151)
use warnings;
use strict;

my @outer;
@outer[1, 2, 5] = (['First', 'Row'], ['Second', 'Row'], ['Last', 'Row']);

for my $outer_elc (0..$#outer) {
    if ($outer [$outer_elc]) {
        my $inner_elcs = $#{ $outer[$outer_elc] };
        print "$outer_elc : ", $inner_elcs+1," elements \n";
        for my $inner_elc (0..$inner_elcs) {
            print "\t$inner_elc : $outer[$outer_elc][$inner_elc] \n";
        }
    } else {
        print "Row $outer_elc undefined\n";
    }
}
