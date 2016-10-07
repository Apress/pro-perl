#!/usr/bin/perl
# visible.pl (p515)
use warnings;
use strict;

use Getopt::Long;

my ($verbose, $visible) = (0, -1);
GetOptions(
    "verbose|v+" => \$verbose,
    "visible!" => \$visible,
);

print "Verbose is $verbose\n";
print "Visible is $visible\n";
