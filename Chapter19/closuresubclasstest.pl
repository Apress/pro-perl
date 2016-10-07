#!/usr/bin/perl -w
# closuresubclasstest.pl (p780)
use strict;
use Volume;

my $volume=new Volume();
$volume->height('quite big really');
print $volume->height(),"\n";
