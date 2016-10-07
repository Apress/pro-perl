#!/usr/bin/perl
# attr.pl (p222)
use warnings;
use strict;

{
    package Testing;
    use Alias;
    no strict 'vars';   # to avoid declaring vars

    sub new {
        return bless {
            count => [3, 2, 1],
            message => 'Liftoff!',
        }, shift;
    }

    sub change {
        # define @count and $message locally
        attr(shift);
        # this relies on 'shift' being a hash reference
        @count = (1, 2, 3);
        $message = 'Testing, Testing';
    }
}

my $object = new Testing;
print "Before: ", $object->{message}, "\n";
$object->change;
print "After : ", $object->{message}, "\n";
print $Testing::message, "\n";    # warning - 'attr' vars do not persist
close Testing::count;
