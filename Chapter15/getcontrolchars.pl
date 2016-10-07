#!/usr/bin/perl
# getcontrolchars.pl (p549)
use strict;
use warnings;

use Term::ReadKey;

my %controlchars = GetControlChars;
foreach (sort keys %controlchars) {
    print "$_\t=>" , ord ($controlchars{$_}), "\n";
}
