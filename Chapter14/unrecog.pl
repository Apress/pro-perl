#!/usr/bin/perl
# unrecog.pl (p521-522)
use warnings;
use strict;

use Getopt::Long;

my ($verbose, $size, @oob_values);

sub handle_unknown {
    # push extra values onto out-of-band value list
    push @oob_values, @_;
}

GetOptions(
    "verbose+" => \$verbose,        # verbose option
    "size=i"   => \$size,           # size option
    "<>"       => \&handle_unknown, # unknown values
);

print "Verbose ", $verbose?'on':'off',"\n";
print "Size is ", (defined $size)?$size:'undefined',"\n";
print "Extras: ", join(',', @oob_values),"\n" if @oob_values;
