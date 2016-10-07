#!/usr/bin/perl
# charscript.pl (p965, adapted from charblock.pl)
use strict;
use warnings;
use Unicode::UCD qw(charscript);

die "Usage: $0 <script name|code value|U+NNNN> ... \n"
    unless @ARGV;

foreach my $script (@ARGV) {
    # get the script for a code or the code ranges for a script
    my $ranges=charscript($script);

    if ($ranges) {
        if (ref $ranges) {
            print "Script $script:";
            # mapped name to array of ranges
            foreach my $range (@$ranges) {
                printf " U+%04X..U+%04X", @$range;
            }
        } else {
            # mapped a code to a script name
            print "Code $script is in the script '$ranges'";
        }
    } else {
        print "$script : *Invalid code value or script name*";
    }
    print "\n";
}

