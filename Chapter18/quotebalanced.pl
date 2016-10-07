#!/usr/bin/perl
# quotebalanced1.pl (p665)
use strict;
use warnings;
use Text::Balanced qw(extract_delimited);

my $input=qq[The "quick" brown fox "jumped over" the lazy "dog"];

my ($extracted,$remainder)=extract_delimited($input,'"','The ');
print qq[Got $extracted, remainder <$remainder>\n];
