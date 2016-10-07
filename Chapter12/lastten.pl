#!/usr/bin/perl
# lastten.pl (p420)
use warnings;
use strict;

print "Reading...";
open READ, "myfile" or die "Cannot open: $! \n";
my @lines = <READ>;
print "$. lines read \n";
close READ;

exit if $#lines < 9;

print "Writing...";
open WRITE, "> myfile" or die "Cannot write: $! \n";
print WRITE $_ foreach @lines[-10..-1];
print "done \n";
close WRITE;
