#!/usr/bin/perl
# currencies.pl (p984-985)
use strict;
use warnings;
use Locale::Currency qw(all_currency_codes code2currency);

my @codes= all_currency_codes();
print map {
    "'$_' is the ".code2currency($_)."\n"
} sort @codes;
