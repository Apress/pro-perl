#!/usr/bin/perl
# inlinefraction2.pl (p848)
use strict;
use warnings;

use Inline 'C' => 'DATA';

print heavyfraction(10,3);

__DATA__
__C__
int heavyfraction (int num1, int num2) {
    int result;

    if (num1 > num2) {
        result = num1 / num2;
    } else {
        result = num2 / num1;
    }

    return result;
}
