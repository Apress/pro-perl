# Game/FieldCard.pm (p794-795)
package Game::FieldCard;
use strict;
use fields qw(name suit _up_sleeve);

sub new {
    my $proto=shift;
    my $class=ref($proto) || $proto;

    my Game::FieldCard $self=fields::new($class);
    $self->initialize(@_);
    return $self;
}

sub initialize {
    my Game::FieldCard $self=shift;
    my ($name,$suit)=@_;
    $self->{name} = $name;
    $self->{suit} = $suit;
}

1;
