#!/usr/bin/perl
# capitalize.pl (p189)
use warnings;
use strict;

my @array = ("onE", "two", "THREE", "fOUR", "FiVe");
foreach (@array) {
   # lc turns the word into lowercase, ucfirst then capitalizes the first letter
   $_ = ucfirst lc;   # lc uses $_ by default with no argument
}
print join(',', @array);
