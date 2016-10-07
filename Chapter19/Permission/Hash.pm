# Permission/Hash.pm (p808-809)
# (this module is used by permhash.pl, p809)
package Permission::Hash;
use strict;

use Carp;

sub TIEHASH {
    my ($class, %cfg) = @_;

    my $self = bless {}, shift;

    $self->{value} = ();
    foreach ('read', 'write', 'delete') {
        $self->{$_} = (defined $cfg{$_})?$cfg{$_}:1;
    }

    return $self;
}

sub FETCH {
    my ($self, $key) = @_;
    croak "Cannot read key '$key'" unless $self->{read};
    return $self->{value}{$key};
}
sub STORE {
    my ($self, $key, $value) = @_;
    croak "Cannot write key '$key'" unless $self->{write};
    $self->{value}{$key} = $value;
}

sub EXISTS {
    my ($self, $key) = @_;
    croak "Cannot read key '$key'" unless $self->{read};
    return exists $self->{value}{$key};
}

sub CLEAR {
    my $self = shift;
    croak "Cannot delete hash" unless $self->{delete};
    $self->{value} = ();
}

sub DELETE {
    my ($self, $key) = @_;
    croak "Cannot delete key '$key'" unless $self->{delete};
    return delete $self->{value}{$key};
}

sub FIRSTKEY {
    my $self = shift;
    my $dummy = keys %{$self->{value}};   #reset iterator
    return $self->NEXTKEY;
}

sub NEXTKEY {
    return each %{shift->{value}};
}

1;
