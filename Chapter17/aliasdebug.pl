#!/usr/bin/perl
# aliasdebug.pl (p595)
use strict;
use warnings;
use subs 'debug';

sub debug_off {}
sub debug_on { print STDERR @_,"\n"; }
*debug = $ENV{DEBUG}? \&debug_on : \&debug_off;

debug "Debugging is enabled";
