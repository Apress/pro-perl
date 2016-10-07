#!/usr/bin/perl
# fib3.pl (p212)
use warnings;
use strict;

sub fibonacci3 {
    my ($count, $aref) = @_;
    
    unless ($aref) {
        # first call - initialize
        $aref = [1,1];
        $count -= scalar(@{$aref});
    }

    if ($count--) {
        my $next = $aref->[-1] + $aref->[-2];
        push @{$aref}, $next;
        @_ = ($count, $aref);
        goto &fibonacci3;
    } else {
        return wantarray?@{$aref}:$aref->[-1];
    }
}

# calculate 1000th element of standard Fibonacci sequence
print scalar(fibonacci3(1000)), "\n";
