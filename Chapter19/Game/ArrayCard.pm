# Game/ArrayCard.pm (p725-726)
package Game::ArrayCard;
use strict;

use Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(NAME SUIT);

use constant NAME => 0;
use constant SUIT => 1;

sub new {
    my ($class, $name, $suit) = @_;
    my $self = bless [], $class;
    $self->[NAME] = $name;
    $self->[SUIT] = $suit;
    return $self;
}

1;
