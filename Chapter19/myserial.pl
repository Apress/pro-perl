#!/usr/bin/perl
# myserial.pl (p747)
use warnings;
use strict;

use MySerial;

my $serial = new MySerial;
print "Serial number ", $serial->serial, " created at ",
  scalar(localtime $serial->time), "\n";
$serial->next(10000);
sleep(1);
my $serial2 = new MySerial;
print "Serial number ",$serial2->serial," created at ",
  scalar(localtime $serial2->time), "\n";
