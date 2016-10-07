#!/usr/bin/perl
# befaft.pl (p187)
use warnings;

$var = 42;
print "Before: $var \n";
foreach $var (1..5) {
    print "Inside: $var \n";
}
print "After: $var \n"; # prints '42', not '5'
