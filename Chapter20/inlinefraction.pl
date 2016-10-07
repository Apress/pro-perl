#!/usr/bin/perl
# inlinefraction.pl (p847)
use strict;
use warnings;

use Inline 'C' => qq[
int heavyfraction (int num1, int num2) {
    int result;

    if (num1 > num2) {
        result = num1 / num2;
    } else {
        result = num2 / num1;
    }

    return result;
}
];

print heavyfraction(10,3);
