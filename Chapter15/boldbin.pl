#!/usr/bin/perl
# boldbin.pl (p562)
use warnings;
use strict;

use Term::ANSIColor;

my $number = rand 10_000_000;

# my $bintext = sprintf '%b', $number;   # if Perl >=5.6
my $bintext = unpack 'B32', pack('d', $number);

$Term::ANSIColor::EACHLINE ='0';

print colored($bintext, 'bold cyan');
