#!/usr/bin/perl
# hash1.pl (p125)
use strict;
use warnings;

# define a default set of hash keys and values
my %default_animals = (Cat => 'Tom', Mouse => 'Jerry');

# get another set of keys and values
my %input_animals = (Cat => 'Ginger', Mouse => 'Jerry');

# providing keys and values from second hash after those
# in default hash overwrites them in the result
my %animals = (%default_animals, %input_animals);
print "$animals{Cat}\n"; # prints 'Ginger'
