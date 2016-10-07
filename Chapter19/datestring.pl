#!/usr/bin/perl (p789)
# datestring.pl
use warnings;
use strict;

use DateString;

my $date = new DateString(time);
print "$date \n";
$date->format('GB');
print "$date \n";
$date->format('US');
print "$date \n";
