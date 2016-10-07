#!/usr/bin/perl
# ref1.pl (p136)
use warnings;
use strict;

my $text = "This is a value";

my $ref1 = \$text;
my $ref2 = \$text;

print $ref1 == $ref2;  # produces '1'
$$ref1 = 'New value';
print $$ref2;   # produces 'New value'
