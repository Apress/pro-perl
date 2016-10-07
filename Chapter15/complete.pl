#!/usr/bin/perl
# complete.pl (p556)
use warnings;
use strict;

use Term::Complete;

my @terms = qw(one two three four five six seven eight nine ten);
my $input = Complete("Enter some number words: ",@terms);
print "You entered: $input\n";
