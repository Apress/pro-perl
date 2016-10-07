#!/usr/bin/perl
# trace.pl (p620-621)
use warnings;
use strict;

{
    use Dumpvalue;

    # private dumper object for 'trace' subroutine
    my $dumper = new Dumpvalue (compactDump => 1);

    my $level = $ENV{TRACE_ON};
    $level |= 0;   # default to no tracing

    sub trace {
        $dumper->dumpValues(@_) if $_[0] <= $level;
    }
}

my %hash = (one => 1, two => 2);
my @array = (1..10);

# a level 2 trace statement
trace 2, \%hash, \@array;
