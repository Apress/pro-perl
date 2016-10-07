#!/usr/bin/perl
# simplegrep2.pl (p507)
use warnings;
use strict;

die "Usage: $0 <pattern> [<file> ...]\n" unless scalar(@ARGV);
my $pattern = shift @ARGV;   #get pattern from first argument
while (<>) {
    print "$ARGV:$. $_" if /$pattern/;
    close (ARGV) if eof;
}
