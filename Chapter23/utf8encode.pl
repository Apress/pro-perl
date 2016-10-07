#!/usr/bin/perl
# utf8encode.pl (p973-974)

my $Psi=chr(0x471);
print "Wide-character length: ",length($Psi),"\n";
print "First character code : ",ord(substr $Psi,0,1),"\n";
utf8::encode $Psi;
print "Byte length: ",length($Psi),"\n";
print "First character code : ",ord(substr $Psi,0,1),"\n";
utf8::decode $Psi;
print "Wide-character again: ",length($Psi),"\n";
print "First character code : ",ord(substr $Psi,0,1),"\n";
