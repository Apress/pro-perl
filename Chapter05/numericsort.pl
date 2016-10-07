#!/usr/bin/perl
# numericsort.pl (p118)
use strict;
use warnings;

# force interpretation of $a and $b as floating point numbers
sub numerically {$a*1.0 <=> $b*1.0 or $a cmp $b};

my @words = qw(1e2 2e1 3);
print 'Normal sort:  ', join(', ', sort @words), "\n";
print 'Numeric sort: ', join(', ', sort numerically @words), "\n";
