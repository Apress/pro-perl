#!/usr/bin/perl
# readlinefeatures.pl (p553)
use warnings;
use strict;

use Term::ReadLine;

my $term = new Term::ReadLine "Find Features";
my %features = %{$term->Features};

print "Features supported by ",$term->ReadLine,"\n";
foreach (sort keys %features) {
    print "\t$_ => \t$features{$_}\n";
}
