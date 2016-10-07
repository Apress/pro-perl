#!/usr/bin/perl
# symbolic_ref.pl (p141-142)
use warnings;
use strict;
no strict 'refs';

our @array = (1, 2, 3); # only package variables allowed

my $symref = 'array';
my $total = $#$symref;
$total++;
print "$symref has $total elements \n";
foreach (@$symref) {
    print "Got: $_ \n";
}
