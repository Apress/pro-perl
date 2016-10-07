# Autoloading2.pm (p773-774)
package Autoloading2;
use strict;
use Carp;

# 'standard' list of attributes -- expanded later
my %attrs=map {$_ => 1} qw(name number rank);

sub new {
    my $class=shift;

    my $self=bless {}, $class;
    $self->{'_attrs'}=\%attrs;

    return $self;
}

# this generic accessor/mutator is called by the subroutines that
# are created by the AUTOLOAD subroutine, below. It is not intended
# to be called directly, as hinted by the leading underscore.
sub _property ($$;$) {
    my ($self,$attr,$value)=@_;



    $self->{$attr}=$value
 if defined $value;


    return $self->{$attr};
}

sub AUTOLOAD {
    our $AUTOLOAD;

    my $attr;
    $AUTOLOAD=~/([^:]+)$/ and $attr=$1;

    # abort if this was a destructor call
    return if $attr eq 'DESTROY';

    # otherwise, invent a method and call it
    my $self=shift;
    if ($self->{'_attrs'}{$attr}) {
        eval "sub $attr {return shift->_property('$attr',\@_);}";
        $self->$attr(@_);
    } else {
        my $class=(ref $self) || $self;
        croak "Undefined method ${class}::$attr called";
    }
}

sub add_attrs {
    my $self=shift;

    map { $self->{'_attrs'}{$_}=1 } @_;
}

1;
