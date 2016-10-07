# Game/Card1.pm (p724-725)
# (this module is used by ace.pl, p725)
package Game::Card;
use strict;

sub new {
    my ($class, $name, $suit) = @_;
    my $self = bless {}, $class;

    $self->{name} = $name;
    $self->{suit} = $suit;
    return $self;
}

1;
