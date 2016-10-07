# Game/GenericCard.pm (p734)
package Game::Card;
use strict;

sub new ($;$$) {
	my ($class,$name,$suit)=@_;
	$class=(ref $class) || $class;

	my $self=bless {}, $class;
	$self->name($name);
	$self->suit($suit);
	return $self;
}

sub _property ($$;$) {
	my ($self,$attr,$value)=@_;

	if ($value) {
		my $oldv=$self->{$attr};
		$self->{$attr}=$value;
		return $oldv;
	} 
	
	return $self->{$attr};
}

sub suit ($;$) { return shift->_property('suit',@_); }
sub name ($;$) { return shift->_property('name',@_); }

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
