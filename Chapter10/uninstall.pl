#!/usr/bin/perl
# uninstall.pl (p299)
use strict;

BEGIN { print "Now you see me: "; }
use Uninstallable;
BEGIN { print $Uninstallable::message; }

BEGIN { print "Now you don't!\n"; }
no Uninstallable;
BEGIN { print $Uninstallable::message; }
