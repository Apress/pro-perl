#!/usr/bin/perl
# simplegrep1.pl (p506)
use warnings;
use strict;

die "Usage: $0 <pattern> <file> [<file> ...]\n" unless scalar(@ARGV)>1;
my $pattern = shift @ARGV;   # get pattern from first argument
while (<>) {
    print "$ARGV:$. $_" if /$pattern/o; #o - compile pattern once only
    close (ARGV) if eof;
}
