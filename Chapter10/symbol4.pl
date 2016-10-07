#!/usr/bin/perl
# symbol4.pl (p281)
use warnings;
use strict;

use Symbol;

my $fqref = qualify_to_ref('scalar','My::Module');
$$fqref =\"Hello World\n";
print My::Module::get_scalar();

package My::Module;
our $scalar;   # provide access to scalar defined above
sub get_scalar {
    return $scalar;
}
