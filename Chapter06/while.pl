#!/usr/bin/perl
# while.pl (p170)
use warnings;
use strict;

my $n = 0;

print "With a while loop:\n";
while (++$n < 4) { print "Hello $n \n"; }

print "With a foreach loop:\n";
foreach my $n (1..3) { print "Hello $n \n"; }

print "With a bare block and redo: \n";
$n = 1; { print "Hello $n \n";
last if (++$n > 3); redo; }
