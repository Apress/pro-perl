#!/usr/bin/perl
# whilequotebalanced.pl (p671)
use strict;
use warnings;
use Text::Balanced qw(extract_delimited);

my $input=qq[The "quick" brown fox "jumped over" the lazy "dog"];
my ($extracted,$remainder);

do {
    ($extracted,$remainder)=extract_delimited($input,'"',qr/[^"]+/);
    print qq[Got $extracted, remainder <$remainder>\n];
} while ($extracted and $remainder);
