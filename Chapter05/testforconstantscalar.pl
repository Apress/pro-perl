#!/usr/bin/perl -w
# testforconstantscalar.pl (p163)

use Scalar::Util qw(readonly);
my $constant="immutable";
print "scalar is ",(readonly($constant)?"constant":"variable"),"\n";
Internals::SvREADONLY($constant => 1);
print "scalar is ",(readonly($constant)?"constant":"variable"),"\n";
