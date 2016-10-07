#!/usr/bin/perl
# serialdestroy.pl (p781)
use warnings;
use strict;

use SerialDestructor; #as Serial.pm, plus DESTROY sub

my @serials;
foreach (1..5) {
    push @serials, new Serial;
}

my $serial = new Serial(2001);
