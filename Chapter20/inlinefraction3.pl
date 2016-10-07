#!/usr/bin/perl
# inlinefraction3.pl (p849)
use strict;
use warnings;

use Inline::Files;
use Inline 'C';

print heavyfraction(10,3);

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
