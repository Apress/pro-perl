#!/usr/bin/perl
# constantscalar.pl (p162)
use warnings;
use strict;

use vars qw($constantstring); # declare use of package scalar
*constantstring=\"immutable"; # assign constant string to scalar slot of glob
print $constantstring;        # produces 'immutable'
$constantstring='no!';        # Error
