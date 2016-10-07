#!/usr/bin/perl
# multicolor.pl (p562)
use warnings;
use strict;

use Term::ANSIColor;

$Term::ANSIColor::EACHLINE = "\n";

my $text = "This is\nan example\nof multiline\ntext coloring\n";
print colored($text, 'bold yellow');
