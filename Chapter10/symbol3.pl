#!/usr/bin/perl
# symbol3.pl
use warnings;
use strict;

use Symbol;

my $fqref = qualify_to_ref('scalar','My::Module');
$$fqref =\"Hello World\n";
print $My::Module::scalar;
