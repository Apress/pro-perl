#!/usr/bin/perl
# soundex.pl (p677)
use warnings;
use strict;

use Text::Soundex;

while (<>) {
    chomp;   #remove trailing linefeed
    s/\W/ /g;   #zap punctuation, e.g. '.', '@'
    print "'$_' => '@{[soundex(split)]}'\n";
}
