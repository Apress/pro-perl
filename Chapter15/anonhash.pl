#!/usr/bin/perl
# anonhash.pl (p558)
use warnings;
use strict;

use Term::Cap;

# create a terminal capability object - warns of unknown output speed
my $termcap = Term::Cap->Tgetent({ TERM => undef });

print "Capabilities found: ",join(',',sort(keys %{$termcap})),"\n";
