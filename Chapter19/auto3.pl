#!/usr/bin/perl
# auto2.pl (p774)
use warnings;
use strict;

use Autoloading::Subclass;

my $object = new Autoloading::Subclass;

$object->name('Styglian Enumerator');
$object->number('say 6');
$object->size('little'); #no longer an error
print $object->name, " counts ", $object->number, "\n";
print "It's a ", $object->size, " one.\n";
