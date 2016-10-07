#!/usr/bin/perl -w
# insequencemap.pl (p199)
use strict;

my @sequence=(1,1,2,3,5,8,13,21,34,55,89);
my %insequence=map { $_ => 1 } @sequence;
my $number=<>;
chomp $number;
print "$number is ",($insequence{$number}?"":"NOT"),"in sequence\n";
