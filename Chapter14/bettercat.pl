#!/usr/bin/perl
# bettercat.pl (p506)
use warnings;
use strict;

while (<>) {
    print "$ARGV:$.:$_";
    close (ARGV) if eof;
}
