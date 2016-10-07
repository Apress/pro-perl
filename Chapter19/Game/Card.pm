# Game/Card.pm (p761,p773)
package Game::Card;
use strict;

sub new {
   my $class = shift;
   $class = (ref $class) || $class;

   my $self = bless {}, $class;
   $self -> initialize(@_);
   return $self;
}

sub initialize {
   my ($self, $name, $suit) = @_;

   $self -> {name} = $name;
   $self -> {suit} = $suit;
}

sub name ($;$) {
    my ($self,$name)=@_;

    if ($#_) {
        my $oldname=$self->{'name'};
        $self->{'name'}=$name;
        return $oldname;
    } 
    
    return $self->{'name'};
}

sub suit ($;$) {
    my ($self,$suit)=@_;

    if ($#_) {
        my $oldsuit=$self->{'suit'};
        $self->{'suit'}=$suit;
        return $oldsuit;
    } 
    
    return $self->{'suit'};
}

sub fullname ($) {
    my $self=shift;

    if ($self->suit) {
        return $self->name.' of '.$self->suit;
    } elsif ($self->name) {
        return $self->name;
    } 

    return "blank";
}

sub print ($;$) {
    my ($self,$nolf)=@_;

    my $lf=($nolf)?"":"\n";
    print $self->fullname,$lf; 
}

1;
