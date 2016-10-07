#!/usr/bin/perl
# anonsub.pl (p256)
use warnings;
use strict;

our $anonsub = sub {print "Hello World\n"};

*namedsub = \&{$anonsub};
namedsub();
