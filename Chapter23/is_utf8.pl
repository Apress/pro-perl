#!/usr/bin/perl
# is_utf8.pl (p973)
my $tee=chr(0x74);
print "is t wide? ",utf8::is_utf8($tee)?"yes":"no","\n";
my $Psi=chr(0x470);
print "is Psi wide? ",utf8::is_utf8($Psi)?"yes":"no","\n";
