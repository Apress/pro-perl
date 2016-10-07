#!/usr/bin/perl
# ifscope.pl (p251)
use strict;
use warnings;

if ( (my $toss=rand) > 0.5 ) {
    print "Heads ($toss)\n";
} else {
    print "Tails ($toss)\n";
}
