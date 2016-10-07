#!/usr/bin/perl
# dsgamecard.pl (p762)
use warnings;
use strict;
use Game::Card::Serial::Debuggable;

my $card = new Game::Card::Serial::Debuggable('Ace', 'Spades');

print $card->fullname, " (", $card->serial, ") \n";
$card->debug(1);
$card->debug(1, "A debug message on object #", $card->serial);
