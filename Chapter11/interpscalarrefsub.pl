#!/usr/bin/perl
# interpscalarrefsub.pl (p326)
use warnings;
use strict;

sub now { return \scalar(localtime) };

print "The time is ${&now}\n";
