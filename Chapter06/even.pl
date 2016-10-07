#!/usr/bin/perl
# even.pl (p197)
use warnings;
use strict;

# print out even numbers with a do...while loop
my $n = 0;
do { {
    next if ($n % 2);
    print $n, "\n";
} } while ($n++ < 10);

# while (++$n <= 10) {
#     next if ($n % 2);
#     print $n, "\n";
# }
