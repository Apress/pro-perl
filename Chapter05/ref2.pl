#!/usr/bin/perl
# ref2.pl (p136)
use warnings;
use strict;

my $text1 = "This is a value";
my $text2 = "This is a value";

my $ref1 = \$text1;
my $ref2 = \$text2;

print $ref1 == $ref2;   # produces ''

$$ref1 = 'New value';
print $$ref2;  # produces 'This is a value'
