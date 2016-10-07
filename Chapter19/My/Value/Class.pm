# My/Value/Class.pm (p785)
package My::Value::Class;
use strict;

use overload '+'  => \&add,
             '+=' => \&addassign,
             '0+' => \&value; # additional overload, numeric evaluation

sub new {
    my ($class, $value) = @_;
    my $self = bless {}, ref($class) || $class;
    $self->{value}=$value;

    return $self;
}

sub value {
    my ($self, $value) = @_;
    $self->{value} = $value if defined $value;
    return $self->{value};
}

sub add {
    my ($operand1, $operand2) = @_;

    my $result = $operand1->new;
    if (ref $operand2 and $operand2->isa(ref $operand1)) {
        $result->value($operand1->value + $operand2->value);
    } else {
        $result->value($operand1->value + $operand2);
    }
    return $result;
}

sub addassign {
    my ($operand1, $operand2) = @_;

    if (ref $operand2 and $operand2->isa(ref $operand1)) {
        $operand1->value($operand1->value + $operand2->value);
    } else {
        $operand1->value($operand1->value + $operand2);
    }
}

1;
