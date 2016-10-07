# Closure.pm (p778-779,p780)
package Closure2;
use strict;

use Carp;

sub new {
    # get the name of the implementing subclass
    my $class=shift;
    $class=(ref $class) || $class;

    unless ($class->can('attributes')) {
        # if we don't have an attributes method, import() was not called with
        # a list of attributes on this class (or any superclass).
        croak "No attributes defined or inherited by this object class";
    }

    # get the hard-wired attributes from the subclass
    my @attrs=$class->attributes();

    # prep the private attribute hash
    my %attrs=map {$_ => undef} @attrs;

    # create the closure
    my $object=sub {
        croak "Attempt to bypass accessor '$_[0]'" if caller ne __PACKAGE__;
        return _property_sub(\%attrs,@_);
    };

    # return a blessed code reference object
    return bless $object,$class;
}

sub _property_sub {
    my ($href,$attr,$value)=@_;

    # is this a valid attribute?
    unless (exists $href->{$attr}) {
        croak "Attempt to ",(defined $value)?"set":"get",
            " invalid attribute '$attr'";
    } 

    # actually set or get the attribute
    if (defined $value) {
        my $oldv=$href->{$attr};
        $href->{$attr}=$value;
        return $oldv;
    }

    return $href->{$attr};
}

# (p780)
sub import {
    my ($package,@attrs)=@_;

    return unless @attrs;

    # we allow only the direct subclass to define attributes.
    return unless $package eq __PACKAGE__;
    $package=caller;

    foreach my $attr (@attrs) {
        # the method name is the attribute name prefixed by the package
        my $method=$package.'::'.$attr;
        unless (defined &$method) {
            eval "sub $method { \$_[0]->('$attr', \$_[1]); };";
        }
    }

    # create a class method that returns the attribute names for this class.
    # unlike a package variable, the method is read-only.
    my $attributes_method=$package.'::attributes';
    eval "sub $attributes_method { return qw(@attrs) };";
    # we check for this method in 'new' to see if attributes were defined here.
}

1;
