#!/usr/bin/perl
# callsub.pl (p205)
use warnings;
use strict;

sub do_list {
    my ($subref, @in) = @_;
  
    return map { &$subref ($_) } @in;
}

sub add_one {
    return $_[0] + 1;
}

$, = ",";
print do_list (\&add_one, 1, 2, 3);   # prints 2, 3, 4
