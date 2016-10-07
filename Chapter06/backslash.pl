#!/usr/bin/perl
# backslash.pl (p195)
use warnings;
use strict;

my @lines = ();

while (<>) {
    chomp;
    if (s/\\$//) {   #check for and remove a trailing backslash character
        my $line = <>;
        $_.= $line, redo;   # goes to the 'chomp' above
    }
    push @lines, $_;
}

foreach (0..$#lines) {
    print "$_ : $lines[$_] \n";
}
