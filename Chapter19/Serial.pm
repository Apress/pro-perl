# Serial.pm (p735, p736-737, p741, p742)
# (this module is used by serial1.pl, p736)
# (this module is used by serial_a.pl, p737)
# (this module is used by serial2.pl, p742)
# (this module is used by MySerial.pm, p742)
package Serial;
use strict;

use Carp;

# see p737 for 'our' vs 'my' here
my %conf = (
    'start'     => 1,
    'increment' => 1,
);

sub new {
    my $class = (ref $_[0]) || $_[0];
    $conf{start} = $_[1] if defined $_[1];

    my $self=bless {}, $class;
    $self->{serial} = $conf{start};
    $self->{'_next'} = \$conf{start};     # (p741)
    $self->{'_incr'} = \$conf{increment}; # (p741)
    $conf{start} += $conf{increment};
    return $self;
}

sub serial {
    return shift->{serial};
}

# (p736)
sub configure {
    my $class = shift;

    while (my ($key, $value) = (shift, shift)) {
        $key eq 'start' and $conf{start} = int($value), last;
        $key eq 'increment' and do {
            $value = int($value);
            croak "Invalid value '$_'" unless $value;
            $conf{increment} = $value;
            last;
        };
        croak "Invalid name '$key' in import list";
    }
}

# (p742)
sub next ($;$) {
    my ($self, $new) = @_;
    ${$self->{'_next'}} = $new if $new;
    return ${$self->{'_next'}};
}

1;
