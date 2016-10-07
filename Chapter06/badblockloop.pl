#!/usr/bin/perl
# badblockloop.pl (p170)
use warnings;
use strict;

if (defined(my $line = <>)) {
    last if $line =~/quit/;
    print "You entered: $line";
    $line = <>;
    redo; # ERRROR: redo does not work here
}
print "Bye! \n";
