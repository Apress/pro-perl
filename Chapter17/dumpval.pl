#!/usr/bin/perl
# dumpval.pl (p620)
use warnings;
use strict;

use Dumpvalue;

my $dumper = new Dumpvalue(compactDump => 1, globPrint => 1);

my %myhashvariable = (
    'top' => {
        middle => [
            'left', 'right', {
                'bottom' => 1
            }
        ]
    }
);

# dump one variable
$dumper->dumpValue(\%myhashvariable)
