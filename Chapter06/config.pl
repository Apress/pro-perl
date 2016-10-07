#!/usr/bin/perl
# config.pl (p194)
use warnings;
use strict;

my %config = ();

while (<>) {
    chomp;   #strip linefeed

    next if /^\s*$/;    #skip to the next iteration on empty lines
    next if /^\s*\#/;   #skip to the next iteration on comments
    my ($param, $value) = split("=", $_, 2);   #split on first '='
    unless ($value) {
        print ("No value for parameter '$_' \n");
        next;
    }

    $config{$param} = $value;
}

foreach (sort keys %config) {
    print "$_ => $config{$_} \n";
}

