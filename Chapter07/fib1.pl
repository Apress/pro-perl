#!/usr/bin/perl
# fib1.pl (p210-211)
use warnings;
use strict;

sub fibonacci1 {
    my ($count, $aref) = @_;

    unless ($aref) {
        # first call - initialize
        $aref = [1,1];
        $count -= scalar(@{$aref});
    }

    if ($count--) {
        my $next = $aref->[-1] + $aref->[-2];
        push @{$aref}, $next;
        return fibonacci1($count, $aref);
    } else {
        return wantarray?@{$aref}: $aref->[-1];
    }
}

# calculate 10th element of standard Fibonacci sequence
print scalar(fibonacci1(10)), "\n";

# calculate 10th element beyond sequence starting 2, 4
print scalar(fibonacci1(10, [2, 4])), "\n";

# return first ten elements of standard Fibonacci sequence
my @sequence = fibonacci1(10);
print "Sequence: @sequence \n";
