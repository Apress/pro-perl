# Universal/Constructor.pm (p767)
package UNIVERSAL;
use strict;

sub new {
    my $class = shift;
    $class = (ref $class) || $class;

    my $self = bless {}, $class;
    $self->initialize(@_);
    return $self;
}

sub initialize { }

1;
