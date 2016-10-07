#!/usr/bin/perl -w
# scopechange.pl (p253)
use strict;

package First;
our $scalar = "first";     # defines $First::scalar
print $scalar;             # prints $FirstPackage::scalar, produces 'first'

package Second;
print $scalar;             # prints $First::scalar, produces 'first'
our $scalar = "second";
print $scalar;             # prints $Second::scalar, produces 'second'

package Third; {
    our $scalar = "inner"; # declaration contained in block
    print $scalar;         # prints $Third::scalar, produces 'inner'
}

print $scalar;             # print $Second::scalar, produces 'second'
