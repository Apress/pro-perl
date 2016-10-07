#!/usr/bin/perl
# cmpthese.pl (p655)
use warnings;
use strict;

use Benchmark qw(cmpthese);

sub mysubroutine {
    my $timewaster = time**rand;
}

cmpthese(1000000, {
    'Anon Test' => sub {my $timewaster = time**rand},
    'Eval Test' => 'my $timewaster = time**rand',
    'Ref Test'  => \&mysubroutine,
}, 'all');
