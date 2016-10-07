#!/usr/bin/perl
# ace.pl (p725)
use warnings;
use strict;

use Game::Card1;

my $card = new Game::Card('Ace', 'Spades');
print $card->{name};   # produces 'Ace';
$card->{suit} = 'Hearts';   # change card to the Ace of Hearts
