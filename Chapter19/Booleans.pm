# Booleans.pm (p738-740)
# (this module is used by booleans.pl, p740)
package Booleans;
use strict;
no strict 'refs';

use Carp;

# establish set boolean vars
sub import {
    my $class = shift;
    ${"${class}::conf"}{$_} = 1 foreach @_;
}

# establish unset boolean vars
sub unimport {
    my $class = shift;
    ${"${class}::conf"}{$_} = 0 foreach @_;
}

# private method ?? does all the actual work for set, unset, and delete
# only variables already established may be altered here.
sub _set ($$$) {
    my $class = (ref $_[0]) || $_[0];
    unless (exists ${"${class}::conf"}{$_[1]}) {
        croak "Boolean $_[1] not imported";
    }

    if (defined $_[2]) {
        ${"${class}::conf"}{$_[1]} = $_[2]?1:0;
    } else {
        delete ${"${class}::conf"}{$_[1]};
    }
}

# return variable value
sub get ($$) {
    my $class = (ref $_[0]) || $_[0];
    return ${"${class}::conf"}{$_[1]};
}

# set a variable
sub set ($$) {
    shift->_set(@_, 1);
}

# clear a variable
sub unset ($$) {
    shift->_set(@_, 0);
}

# delete an existing variable
sub delete ($$) {
    shift->_set(@_, undef);
}

# invent a new variable -- _set doesn't allow this
sub create ($$$) {
    ${"$_[0]\:\:conf"}{$_[1]} = $_[2] ? 1 : 0;
}

# return a list of all set, all unset or all variables
sub list ($;$) {
     my ($class,$set)=@_;

    if (defined $set) {
        # return list of set or unset vars
        my @vars;
        foreach (keys %{"${class}::conf"}) {
            push @vars,$_ unless ${"${class}::conf"}{$_} ^ $set;
        }
        return @vars;
    } else {
        # return list of all vars in set
        return keys %{"$_[0]\:\:conf"};
    }
}

1;
