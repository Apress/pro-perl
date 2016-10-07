#!/usr/bin/perl
# autol.pl (p772-773)
use warnings;
use strict;

use Autoloading;

my $object = new Autoloading;

$object->name('Styglian Enumerator');
$object->number('say 6');

print $object->name, " counts ", $object->number, "\n";
