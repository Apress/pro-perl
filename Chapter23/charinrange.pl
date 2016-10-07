#!/usr/bin/perl
# charinrange.pl (p965-966)
use strict;
use warnings;
use charnames ':short';
use Unicode::UCD qw(charinrange charblock);

my $char="\N{Cyrillic:Psi}";

print "In block Cyrillic!\n"
    if $char =~ /\p{InCyrillic}/;

print "In block Cyrillic!\n"
    if charinrange(charblock("Cyrillic"), ord($char));
