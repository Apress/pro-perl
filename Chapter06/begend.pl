#!/usr/bin/perl
# begend.pl (p172)
use warnings;
use strict;

END {
    print "Exiting... \n";
}

print "Running! \n";

fun();

sub fun {
    print "Inside fun \n";
}

BEGIN {
    print "Compiling... \n";
    # can't call 'fun' - not compiled yet
    # fun();
}
