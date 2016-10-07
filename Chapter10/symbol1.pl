#!/usr/bin/perl
# symbol1.pl (p280)
use warnings;

use Symbol;

my $fqname = qualify('scalar');
$$fqname = "Hello World\n";
print $scalar;   # produces 'Hello World'
