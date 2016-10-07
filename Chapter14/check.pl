#!/usr/bin/perl
# check.pl
use warnings;
use strict;
use Getopt::Long;

my $option = undef;  # make it undef explicitly, just to make it clear
GetOptions ("option!" => \$option);
if (defined $option) {
    # the option was seen on the command line
} else {
    # the option was not specified
}
