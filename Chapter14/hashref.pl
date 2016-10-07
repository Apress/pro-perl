#!/usr/bin/perl
# hashref.pl (p511)
use warnings;
use strict;

use Getopt::Long;

my %opts;
GetOptions(\%opts, 'verbose', 'background');
