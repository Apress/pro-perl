#!/usr/bin/perl
# setlocale.pl
use strict;
use warnings;
use locale;
use POSIX 'locale_h';

setlocale(LC_COLLATE, 'fr_CH');
setlocale(LC_NUMERIC, 'en_US');
setlocale(LC_MONETARY, 'fr_CH');
setlocale(LC_TIME, 'fr_FR');

print "The monetary locale is ", setlocale(LC_MONETARY), "\n";

print "All locale settings: ", setlocale(LC_ALL), "\n";
