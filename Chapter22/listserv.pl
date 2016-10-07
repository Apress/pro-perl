#!/usr/bin/perl
# listserv.pl (p942,p950)
use warnings;
use strict;

while (my ($name, $aliases, $port, $proto) = getservent) {
    print "$name\t$port/$proto\t$aliases\n";
}
