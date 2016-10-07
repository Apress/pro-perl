#!/usr/bin/perl
# abbrev.pl (p660-661)
use warnings;
use strict;
use Text::Abbrev;

my $abbreviations = abbrev(@ARGV);

foreach (sort keys %{$abbreviations}) {
    print "$_ => $abbreviations->{$_} \n";
}
