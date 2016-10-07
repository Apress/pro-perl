#!/usr/bin/perl
# extractlctagged.pl (p668-669)
use strict;
use warnings;
use Text::Balanced qw(extract_tagged);

my $input=qq[<TEXT>The quick brown <subject>fox</subject> jumped over the lazy <object>dog<?object></TEXT>];

my ($extracted,$remainder)=
  extract_tagged($input,"<[a-z]+>",undef,".*?(?=<[a-z]+>)");
print qq[Got "$extracted"\nRemainder "$remainder"\n];
