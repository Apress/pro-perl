#!/usr/bin/perl
# blockwhile.pl (p171)
use warnings;
use strict;

while (my $line = <>) {
    last if $line =~/quit/;
    print "You entered: $line";
}
print "Bye! \n";
