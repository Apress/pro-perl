#!/usr/bin/perl
# bracebalanced1.pl (p671-672)
use strict;
use warnings;
use Text::Balanced qw(extract_multiple extract_bracketed);

my $input=qq[The (<quick brown> fox) {jumped} over the (<lazy> dog)];

my @matches=extract_multiple(
    $input,
    [ \&extract_bracketed ],
    undef, 1
);
print "Got ",scalar(@matches)," matches\n";
print $_+1,"='",$matches[$_],"'\n" foreach (0..$#matches);
