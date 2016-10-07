#!/usr/bin/perl
# shell.pl (p662)
use warnings;
use strict;

use Text::ParseWords qw(shellwords);

my @input = (
    'This is "a phrase"',
    'So is\ this',
    q('and this'),
    "This isn\\'t",
    'Neither \"is this\"',
);

print "Input: ", join(' ',@input),"\n";

my @words = shellwords(@input); print scalar(@words), " words:\n";
print "\t$_\n" foreach @words;
