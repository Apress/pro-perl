#!/usr/bin/perl
# fix.pl (p180)
use warnings;
use strict;
my $word = "mit";
my $fix = "re";
my $before = int(<>);   #no warnings in case we enter no numeric text

($before ? substr($word, 0, 0): substr ($word, length($word), 0)) = $fix;
print $word, "\n";
