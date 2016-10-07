#!/usr/bin/perl
# mytest.pl (p632-633, adapted)
use strict;
use warnings;

use Test;
BEGIN {plan tests => 8, todo => [3,4], onfail =>
    sub {warn 'Oh no, not again'}
}

ok (0);   # an automatic failure
ok (1);   # an automatic success
#...
