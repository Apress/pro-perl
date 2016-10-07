#!/usr/bin/perl
# repanchor2.pl (p343)
use warnings;
use strict;

while (<>) {
    chomp;   # strip trailing linefeed from $_
    next if /^\s*($|#)/;   # skip blank lines and comments
    print "Got: $_ \n";
}

