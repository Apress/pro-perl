#!/usr/bin/perl
# rmtree.pl (p496)
use strict;
use warnings;
use File::Path;

my $path=$ARGV[0];

my $verbose = 0;
my $safe = 1;
rmtree $path, $verbose, $safe;

# or simply...
# remove all paths supplied, silently and safely.
rmtree(\@ARGV, 0, 1);
