#!/usr/bin/perl
# splitwords.pl (p661-662)
use warnings;
use strict;

my @words;
push @words, split foreach(<>);
print scalar(@words), " words: @words \n";
