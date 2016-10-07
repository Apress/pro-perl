#!/usr/bin/perl
# sortsub.pl (p205)
use warnings;
use strict;

# a list to sort
my @list = (3, 4, 2, 5, 6, 9, 1);

# directly with a block
print sort {$a cmp $b} @list;

# with a named subroutine
sub sortsub {
    return $a cmp $b;
}
