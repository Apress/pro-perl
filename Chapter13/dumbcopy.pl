#!/usr/bin/perl
# dumbcopy.pl (p470)
use warnings;
use strict;

print "Filename: ";
my $infile = <>;
chomp $infile;
print "New name: ";
my $outfile = <>;
chomp $outfile;
open IN, $infile;
open OUT, "> $outfile";
print OUT <IN>;
close IN;
close OUT;
