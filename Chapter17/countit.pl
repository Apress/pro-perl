#!/usr/bin/perl
# countit.pl (p656)
use warnings;
use strict;

use Benchmark qw(countit timestr);

sub mysubroutine {
    my $timewaster = time**rand;
}

my $result = countit(10, 'mysubroutine');

print "Executed ", $result->iters, " iterations in ",
  timestr($result, 'noc'), "\n";
