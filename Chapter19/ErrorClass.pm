# ErrorClass.pm (p757-759)
# (this module is used by error.pl, p759)
package ErrorClass;
use strict;

use Errno;
no strict 'refs';

my %errcache;

sub new {
    my ($class, $error) = @_;
    $class = (ref $class) || $class;
    $error = $error || $!;
    # construct the subclass name
    my $subclass = $class. '::'. _error_from_errno($error);

    # cause subclass to inherit from us
    unless (@{$subclass. '::ISA'}) {
        @{$subclass. '::ISA'} = qw(ErrorClass);
    }

    # return reference to error, blessed into subclass
    return bless \$error, $subclass;
}

# return the integer value of the error
sub number {
    my $self = shift;
    return int($$self);
}

# return the message of the error
sub message {
    my $self = shift;
    return ''.$$self;
}

# accessor/mutator
sub error {
    my ($self, $error) = @_;
    if (defined $error) {
        my $old = $$self;
        $$self = $error;
        return $old;
    }
    return $$self;
}

# subroutine to find the name of an error number
sub _error_from_errno {
    my $errno = int(shift);

    # do we already know this one by name?
    if (defined $errcache{$errno}) {
        return $errcache{$errno};
    }

    # otherwise, search for it in the export list
    my ($name, $number);
    foreach $name (@Errno::EXPORT_OK) {
        $number = Errno->$name;
        $errcache{$number} = $name;
        return $name if $errno == $number;
    }

    # unlikely, but just in case...
    return 'UNKNOWN';
}

1;
