#!/usr/bin/perl
# blockloop.pl (p170)
use warnings;
use strict;

if (defined(my $line = <>)) { { # <- note the extra block
    last if $line =~/quit/;
    print "You entered: $line";
    $line = <>; redo;
} }
print "Bye! \n";
