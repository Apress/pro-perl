#!/usr/bin/perl
# addressnest.pl (p798)
use warnings;
use strict;

use AddressNest;

my $address = new Address(
    name => 'Me Myself',
    city => 'My Town',
    address => new Address::Lines,
);

$address->address->house('My House');
$address->address->street('123 My Street');

print $address->name, " lives at: \n",
    "\t", $address->address->house, "\n",
    "\t", $address->address->street, "\n",
    "in the city of ", $address->city, "\n";
