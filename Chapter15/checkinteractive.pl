#!/usr/bin/perl
# checkinteractive.pl (p540)
use strict;
use warnings;

my $is_interactive=-t STDIN && -t STDOUT;

print "We are ",($is_interactive?"interactive"
                 :"not interactive"),"\n";
