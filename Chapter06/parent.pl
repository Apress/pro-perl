#!/usr/bin/perl
# parent.pl (p167)
use warnings;
use strict;

my $text = "This is the parent";
require 'child.pl';
print "$text \n";   # produces "This is the parent"
