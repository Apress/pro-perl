#!/usr/bin/perl
# symbol2.pl (p280)
use warnings;

use Symbol;

my $fqname = qualify('scalar','My::Module');
$$fqname = "Hello World\n";
print $My::Module::scalar;
