#!/usr/bin/perl
# vowels2.pl (p366)
use warnings;
use strict;

my $text = "beautiful creature";
# find adjacent vowels
while ($text =~ /(?=([aeiou]{2}))/g) {
    print "Found adjacent '$1' at position ", pos($text), "\n";
}
