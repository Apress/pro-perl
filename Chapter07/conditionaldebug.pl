#!/usr/bin/perl
# conditionaldebug.pl (p213)
use strict;
use warnings;
use subs qw(debug);

unless (defined &debug) {
    if ($ENV{DEBUG_ENABLED}) {
        *debug = sub { print STDERR "@_\n" };
    } else {
        *debug = sub { }; #stub
    }
}

debug "In debug mode";
