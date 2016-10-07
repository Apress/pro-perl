#!/usr/bin/perl
# testcoverage.pl (p644-645)
use strict;
use warnings;

sub heads () {
    my $head="Head";
    $head.="s";
    return $head;
}

sub tails () {
    return ucfirst lc "TAILS";
}

if (rand > 0.5) {
    print heads();
} else {
    print tails();
}

print "\n";
