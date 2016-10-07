#!/usr/bin/perl
# charscripts.pl (p964, adapted from charblocks.pl)
use strict;
use warnings;
use Unicode::UCD qw(charscripts);

my $blkref=charscripts();

foreach my $script (sort keys %$blkref) {
    printf "%10s :", $script;
    my @ranges=@{$blkref->{$script}};
    foreach my $range (@ranges) {
        printf " U+%04X..U+%04X", @$range;
    }
    print "\n";
}

