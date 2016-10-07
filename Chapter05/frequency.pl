#!/usr/bin/perl
# frequency.pl (p159)
use warnings;
use strict;

sub frequency {
    my $text = join('', @_);
    my %letters;
    foreach (split //, $text) {
        $letters{$_}++;
    }
    return %letters;
}

my $text = "the quick brown fox jumps over the lazy dog";

my %count = frequency($text);

print "'$text' contains: \n";
foreach (sort keys %count) {
    print "\t", $count{$_}, " '$_", ($count{$_} == 1)? "'": "'s", "\n";
}
