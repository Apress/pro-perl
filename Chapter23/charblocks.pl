#!/usr/bin/perl
# charblocks.pl (p963-964)
use strict;
use warnings;
use Unicode::UCD qw(charblocks);

my $blkref=charblocks();

foreach my $block (sort keys %$blkref) {
    printf "%40s :", $block;
    my @ranges=@{$blkref->{$block}};
    foreach my $range (@ranges) {
        printf " U+%04X..U+%04X", @$range;
    }
    print "\n";
}

