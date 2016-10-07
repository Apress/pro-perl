#!/usr/bin/perl
# filenames.pl (p516)
use strict;
use warnings;

use Getopt::Long;

my @filenames; GetOptions("file=s" => \@filenames);

print scalar(@filenames)," files entered\n";

foreach (@filenames) {
    print "\t$_\n";
}
