#!/usr/bin/perl
# readconfig.pl (p68)
use warnings;
use strict;

my %config;

# read lines from files specified on command line or (if none)
# standard input
while (<>) {
   my ($key, $value) = split /=/;   # split on $_
   $config{$key} = $value if $key and $value;
}

print "Configured: ", join(', ', keys %config), "\n";
