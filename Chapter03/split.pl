#!/usr/bin/perl
# split.pl (p68-69)
use warnings;
use strict;

my @words;

# read lines from supplied filenames or (if none)
# standard input
while (<>) {
   # read each line into $_ in turn
   push @words, split; # split $_ into words and store them
}

print "Found ", scalar(@words), " words in input \n";
