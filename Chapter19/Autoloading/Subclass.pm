# Autoloading/Subclass.pm (p775)
package Autoloading::Subclass;
use warnings;
use strict;

use Autoloading2;
our @ISA = qw(Autoloading2);

my @attrs = qw(size location);

sub new {
    my $class = shift;

    my $self = $class->SUPER::new();
    $self->add_attrs(@attrs);
    return $self;
}

1;
