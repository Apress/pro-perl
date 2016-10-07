#!/usr/bin/perl
# termobject.pl (p552)
use warnings;
use strict;

use Term::ReadLine;

my $term = new Term::ReadLine "My Demo Application";
print "This program uses ", $term->ReadLine,"\n";

my $input=$term->readline("Enter some text: ");
print "You entered: $input\n";
