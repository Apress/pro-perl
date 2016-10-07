#!/usr/bin/perl
# noqwcommawarn.pl (p585)
use strict;
use warnings;

sub first3list {
    no warnings 'qw';
    return qw[one,two,three a,b,c first,second,third]
};

print join(" ", first3list()),"\n";
