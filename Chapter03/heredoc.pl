#!/usr/bin/perl
# heredoc.pl (p63)
use warnings;
use strict;

# a foreach loop split across the 'here' document
foreach (split "\n", <<LINES) {
Line 1
Line 2
Line 3
LINES
   print "Got: $_ \n";
}
