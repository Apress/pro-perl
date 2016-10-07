#!/usr/bin/perl
# bitwise.pl (p91)
use warnings;
use strict;

my $a = 3;
my $b = 6;
my $r;

printf "$a = %03b \n", $a;
printf "$b = %03b \n", $b;

$r = $a & $b;   printf "$a & $b = %03b = %d\n", $r, $r;
$r = $a | $b;   printf "$a | $b = %03b = %d\n", $r, $r;
$r = $a ^ $b;   printf "$a ^ $b = %03b = %d\n", $r, $r;
$r = ~$a;       printf "~$a = %03b = %d\n", $r, $r;
