#!/usr/bin/perl
# text.pl (p561)
use warnings;
use strict;

use Term::ANSIColor;

print color('red on_white'), "This is Red on White\n";

# extended example
my @attributes = 'red';
push @attributes, 'on_white';
print color(@attributes), "Or supply attributes as a list...\n";

print color('bold underline'), "This is bold underlined\n";

print color('red on_white'),'This is Red on White', color('reset'), "\n";
