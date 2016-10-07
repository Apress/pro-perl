#!/usr/bin/perl
# increment.pl (p514)
use warnings;
use strict;

use Getopt::Long;

my $verbose = 0;   # default verbosity = off
GetOptions ("verbose+" => \$verbose);
