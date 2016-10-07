# Game/Deck.pm (p768-770)
package Game::Deck;
use strict;
use Game::Card;

### Constructor

sub new {
   my ($class,$suits,$names,$cardclass)=@_;
   my $self=bless {},$class;

   if ($suits) {
      # create cards according to specified arguments

      # these allow us to specify a single suit or name
      $suits=\$suits unless ref $suits;
      $names=\$names unless ref $names;

      # record the names and suits for later
      $self->{'suits'}=$suits;
      $self->{'names'}=$names;
   
      # generate a new set cards
      my @cards;
      foreach my $suit (@$suits) {
         foreach my $name (@$names) {
            my $card=new Game::Card($name,$suit);
            bless $card, $cardclass if defined $cardclass;
            push @cards, $card;
         }
      }

      # add generated cards to deck
      $self->{'cards'}=\@cards;
   } else {
      # initialize an empty deck
      $self->{'cards'}=[];   
   }

   return $self;
}

### Cards, Suits and Names

# return one or more cards from deck by position
sub card {
   my ($self,@range)=@_;
   
   return @{$self->{'cards'}}[@range];
}

sub suits {
   return @{shift->{'suits'}};
}

sub names {
   return @{shift->{'names'}};
}

### Deal and Replace

# shuffle cards randomly
sub shuffle {
   my $self=shift;

   # create a hash of card indices and random numbers
   my %order=map { $_ => rand() } (0..$#{$self->{'cards'}});

   # rebuild the deck using indices sorted by random number
   my @newdeck;
   foreach (sort { $order{$a} <=> $order{$b} } keys %order) {
      push @newdeck, $self->{'cards'}[$_];
   }

   # replace the old order with the new one
   $self->{'cards'}=\@newdeck;
}

# deal cards from the top of the deck
sub deal_from_top {   
   my ($self,$qty)=@_;

   return splice @{$self->{'cards'}},0,$qty;
}

# deal cards from the bottom of the deck
sub deal_from_bottom {
   my ($self,$qty)=@_;
   
   return reverse splice @{$self->{'cards'}},-$qty;   
}

# replace cards on the top of the deck
sub replace_on_top {
   my ($self,@cards)=@_;

   unshift @{$self->{'cards'}},@cards;
} 

# replace cards on the bottom of the deck
sub replace_on_bottom {
   my ($self,@cards)=@_;

   push @{$self->{'cards'}},reverse @cards;
}

### Nomenclature

# return string for specified cards
sub fullnames {
   my ($self,@cards)=@_;

   my $text;
   foreach my $card (@cards) {
      $text.=$card->fullname."\n";
   }
   return $text;
}

# return string of whole deck ('fullname' for Deck class)
sub fulldeck {
   my $self=shift;

   return $self->fullnames(@{$self->{'cards'}});
}

# print out the whole deck
sub print {
   my ($self,@range)=@_;

   if (@range) {
      print $self->fullnames(@{$self->{'cards'}}[@range]);
   } else {
      print $self->fulldeck;
   }
}

1;
