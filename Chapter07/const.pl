#!/usr/bin/perl
# const.pl (p222)
##use strict;
##use warnings;
use Alias qw(alias const);   # add 'alias' and/or 'attr' too, if needed

const $MESSAGE => 'Testing';
print $MESSAGE, "\n";

# ERROR: produce 'Modification of a read-only value attempted at ...'
$MESSAGE = 'Liftoff!';

