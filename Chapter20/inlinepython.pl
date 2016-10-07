#!/usr/bin/perl
# inlinepython.pl (p848-849)
use strict;
use warnings;

use Inline Python => <<_END_OF_PYTHON;
def heavyfraction(x,y):
    if x > y:
        return x / y
    else:
        return y / x
_END_OF_PYTHON

print heavyfraction(10,3);
