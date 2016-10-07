#!/usr/bin/perl
# auto2.pl (p774)
use warnings;
use strict;

use Autoloading2;

my $object = new Autoloading2;

$object->name('Styglian Enumerator');
$object->number('say 6');
$object->size('little'); #ERROR
print $object->name, " counts ", $object->number, "\n";
print "It's a ", $object->size, " one.\n";
