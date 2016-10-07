#!/usr/bin/perl
# address.pl (p797)
use warnings;
use strict;

use Address;

my $address = new Address(
    name => 'Me Myself',
    address => ['My House', '123 My Street'],
    city => 'My Town',
);

print $address->name," lives at: \n",
    "\t", join("\n\t", @{$address->address}), "\n",
    "in the city of ", $address->city, "\n";
