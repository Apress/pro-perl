#!/usr/bin/perl
# iscyrillicblock2.pl (p976-977, from extended examples)
use strict;
use warnings;
use charnames qw(:short);

sub IsCyrillicBlock {
return <<_END_;
0400 0520
1D2B
_END_
}

sub IsScriptNotSupplement {
return <<_END_;
+utf8::IsCyrillic
-utf8::IsCyrillicSupplementary
_END_
}

sub IsNotCyrillicBlock {
return <<_END_;
!0400 0520
-1D2B
_END_
}

sub IsBlockNotScript {
return <<_END_;
main::IsCyrillicBlock
-utf8::IsCyrillic
_END_
}

foreach my $string ("\N{Cyrillic:Psi}", "\x{401}", "\x{502}", "\x{1D2B}") {
    print "Char: ",ord($string),"\n";
    print "\tIsCyrillicBlock\n"    if $string=~/\p{IsCyrillicBlock}/;
    print "\tIsCyrillicBlock-N\n"  if $string=~/\P{IsNotCyrillicBlock}/;
    print "\tIsScriptNotSupplement\n" if $string=~/\p{IsScriptNotSupplement}/;
    print "\tIsNotCyrillicBlock\n" if $string=~/\p{IsNotCyrillicBlock}/;
    print "\tIsBlockNotScript\n"   if $string=~/\p{IsBlockNotScript}/;
}
