#!/usr/bin/perl
# autolocal.pl (p249)
use warnings;
use strict;

my $var = 42;
my $last;
print "Before: $var \n";
foreach $var (1..5) {
    print "Inside: $var \n"; # print "Inside: 1", "Inside: 2" ...
    $last = $var;
}
print "After: $var \n"; # prints '42'
print "Last: $last \n";
