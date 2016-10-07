# MySerial.pm (p746-747, p748)
# (this module is used by myserial.pl, p747)
package MySerial;
use strict;

use Serial;

our @ISA = qw(Serial);

my $next = 1;
my $plus = 1;

sub new {
    my $class = shift;

    # call Serial::new
    my $self = $class->SUPER::new(@_);

    # override parent serial with our own
    #$self->{serial} = $next;  # (p746)
    $self->_set_serial($next); # (p748)

    # replace class data references
    #$self->{'_next'} = \$next; # (p747)
    #$self->{'_incr'} = \$plus; # (p747)
    $self->_set_config(\$next, \$plus); # (p748)

    # add a creation time
    $self->{time} = time;

    return $self;
}

sub time {
    return shift->{time};
}

# (p746-747)
# private method to set location class data
sub _set_config {
    my ($self, $nextref, $incrref) = @_;

    $self->{'_next'} = $nextref;
    $self->{'_incr'} = $incrref;
}

# private method to set serial number
sub _set_serial {
    my $self = shift;
    $self->{serial} = shift;
}

1;
