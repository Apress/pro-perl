#!/usr/bin/perl
# repanchor1.pl (p342)
use warnings;
use strict;

while (<>) {
    chomp;   # strip trailing linefeed from $_
    next if /^(\s*(#.*)?)?$/;   # skip blank lines and comments
    print "Got: $_ \n";
}
