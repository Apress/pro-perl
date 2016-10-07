#!/usr/bin/perl
# plural_message.pl (p179)
use warnings;
use strict;

my @words = split ('\s+', <>);
my $words = scalar (@words);
#ERROR!
my $message = "There ". ($words==1) ? "is" :
  "are". " $words word".
    ($words == 1)?"" : "s". " in the text\n";

print $message;
