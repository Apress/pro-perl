#!/usr/bin/perl
# surname.pl (p676)
use warnings;
use strict;

use Text::Soundex;

# define an ABC of names (as a hash for 'exists')
my %abc = (
    "Hammerstein" => 1,
    "Pineapples" => 1,
    "Blackblood" => 1,
    "Deadlock" => 1,
    "Mekquake" => 1,
    "Rojaws" => 1,
);

# create a token-to-name table
my %tokens;
foreach (keys %abc) {
    $tokens{soundex $_} = $_;
}
# test input against known names
print "Name? ";
while (<>) {
    chomp;
    if (exists $abc{$_}) {
        print "Yes, we have a '$_' here. Another? ";
    } else {
        my $token = soundex $_;
        if (exists $tokens{$token}) {
            print "Did you mean $tokens{$token}? ";
        } else {
            print "Sorry, who again? ";
        }
    }
}
