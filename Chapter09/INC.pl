#!/usr/bin/perl
# INC.pl (p267)
use strict;

print "\%INC contains: \n";
foreach (keys %INC) {
    print " $INC{$_}\n";
}

require File::Copy;
do '/home/perl/include.pl';

print "\n\%INC now contains: \n";
foreach (keys %INC) {
    print " $INC{$_}\n";
}
