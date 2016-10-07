#!/usr/bin/perl
# assignable.pl (p236)
use warnings;
use strict;

my $scalar = "Original String";

sub assignablesub : lvalue {
    $scalar;
}

print $scalar, "\n";
assignablesub = "Replacement String";
print $scalar, "\n";
