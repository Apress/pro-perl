#!/usr/bin/perl
# addition.pl (additional, p785)
use strict;
use warnings;

use My::Value::Class;

my $three=new My::Value::Class(3);
print "3 = ",$three,"\n";
my $four=new My::Value::Class(4);
print "$three + $four = ",$three+$four,"\n";
print "$three + 5 = ",$three+5,"\n";
print "5 + $four = ",5+$four,"\n";
my $six=new My::Value::Class(4);
$six+=2;
print "4 + 2 = ",$six,"\n";

