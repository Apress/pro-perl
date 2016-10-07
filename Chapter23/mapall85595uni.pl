#!/usr/bin/perl
# map88595uni.pl (p971)
use encoding 'cyrillic';

foreach my $code (128..255) {
    my $char=chr($code);
    printf "%02X => U+%04X\n", $code, ord($char);
}
