#!/usr/bin/perl -w
# scalaralias.pl (p256)
use strict;

our $scalar1="one";
*scalar2=\$scalar1;
our $scalar2="two";
print $scalar1;
# produces "two";
