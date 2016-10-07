# My/Custom/Test/Module.pm (p638-639)
package My::Custom::Test::Module;
use strict;
use warnings;
use Test::Builder;
use base qw(Exporter);
our @EXPORT=qw(is_eq is_numeq);

my $builder = Test::Builder->new;

sub import {
    my $self = shift;
    my $package = caller;

    #tell builder where to export to
    $builder->exported_to($package);
    #pass on import arguments to 'plan'
    $builder->plan(@_);
    #pass our own routines up for export
    $self->export_to_level(1, $self, qw[is_eq is_numeq]);
}

### our extended test routines ###

sub is_eq ($$;$) {
    return $builder->is_eq(@_);
}

sub is_numeq ($$;$) {
    return $builder->is_num(@_);
}

1;
