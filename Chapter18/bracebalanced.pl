#!/usr/bin/perl
# bracebalanced.pl (p667)
use strict;
use warnings;
use Text::Balanced qw(extract_bracketed);

my $input=qq[The (<quick brown> fox) {jumped} over the (<lazy> dog)];

my ($extracted,$remainder)=extract_bracketed($input,'()<>{}',qr/[^()<>{}]+/);
print qq[Got "$extracted", remainder "$remainder"\n];
