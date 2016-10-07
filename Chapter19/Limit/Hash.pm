# Limit/Hash.pm (p811-812)
# (this module is used by limithash.pl, p812)
package Limit::Hash;
use strict;

use Carp;
use Tie::Hash;
our @ISA = qw(Tie::StdHash);

sub TIEHASH {
    my ($class, @keys) = @_;

    my $self = $class->SUPER::TIEHASH;
    croak "Must pass either limit or key list" if $#keys == -1;
    if ($#keys) {
        $self->{'_keys'} = {map {$_ => 1} @keys};
    } else {
        croak ",", $keys[0], "' is not a limit" unless int($keys[0]);
        $self->{'_limit'} = $keys[0]+1;   #add one for _limit
    }

    return $self;
}

sub FETCH {
    my ($self, $key) = @_;
    croak "Invalid key '$key'"
        if defined($self->{'_keys'}) and
          (!$self->{'_keys'}{$key} or $key =~ /^_/);
    return $self->SUPER::FETCH($key);
}

sub STORE {
    my ($self, $key, $value) = @_;
    croak "Invalid key '$key'"
        if defined($self->{'_keys'}) and
          (!$self->{'_keys'}{$key} or $key =~ /^_/);
    croak "Limit reached"
        if defined($self->{'_limit'}) and
          (!$self->{'_limit'} or
             $self->{'_limit'} <= scalar(%{$self}));
    $self->SUPER::STORE($key, $value);
}

1;
