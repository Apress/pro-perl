#!/usr/bin/perl
# orderedhash.pl (p123)
use strict;
use warnings;

use Tie::IxHash;
my %hash;
tie %hash, 'Tie::IxHash';
%hash = (one => 1, two => 2, three => 3);
print join(",",keys(%hash)),"\n"; # *always* produces 'one,two,three'
