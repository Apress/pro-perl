#!/usr/bin/perl
# external.pl (p62)
use strict;
use warnings;

my $dir = "/home";
my $files = `ls -1 $dir`;
# or something like `dir c:` for DOS/Windows
print $files;
