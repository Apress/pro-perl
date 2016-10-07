#!/usr/bin/perl
# liftoff.pl (p362)
use warnings;
use strict;

my $text = "3 2 1 liftoff";

# use /gc to remember position
while ($text =~ /(\d)/gc) {
    print "$1...\n";
}

# use \G to match rest of text
if ($text =~ /\G\s*(.+)$/) {
    print ucfirst($1), "!\n";
}
