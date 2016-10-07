#!/usr/bin/perl
# fieldsgamecard.pl (p795)
use strict;
use warnings;
use Game::FieldCard;

my Game::FieldCard $card=new Game::FieldCard(Ace => 'Spades');
print $card->{name};
print $card->{number}; # ERROR: non-existent attribute;
