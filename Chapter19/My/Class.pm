# My/Class.pm (p767)
package My::Class;
use strict;
use Universal::Constructor;

sub initialize {
    my ($self, $value1, $value2) = @_;

    $self->{attr1} = $value1;
    $self->{attr2} = $value2;
    return $self;
}

1;
