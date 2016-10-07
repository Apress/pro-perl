#!/usr/bin/perl 
# localeconv.pl (p982-983)
use strict;
use warnings;
use POSIX qw(localeconv);

my $conv = localeconv();

for my $var (sort keys %$conv) {
    printf "%17s => %s\n", $var, $conv->{$var};
}

