#!/usr/bin/perl
# charblock.pl (p964-965)
use strict;
use warnings;
use Unicode::UCD qw(charblock);

die "Usage: $0 <block name|code value|U+NNNN> ... \n"
    unless @ARGV;

foreach my $block (@ARGV) {
    # get the block for a code or the code ranges for a block
    my $ranges=charblock($block);

    if ($ranges) {
        if (ref $ranges) {
            print "Block $block:";
            # mapped name to array of ranges
            foreach my $range (@$ranges) {
                printf " U+%04X..U+%04X", @$range;
            }
        } else {
            # mapped a code to a block name
            print "Code $block is in the block '$ranges'";
        }
    } else {
        print "$block : *Invalid code value or block name*";
    }
    print "\n";
}

