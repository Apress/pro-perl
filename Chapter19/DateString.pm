# DateString.pm (p788-789)
package DateString;
use strict;

# construct date object and values
sub new {
    my ($class, $time, $format) = @_;
    $class = ref $class || $class;

    $time = time() unless $time;
    my ($d, $m, $y) = (localtime($time))[3, 4, 5];
    my $self = bless {
        day     => $d,
        month   => $m+1,   # months 0-11 to 1-12
        year    => $y+1900,   # years since 1900 to year
        format  => $format || 'Universal'
    }, $class;

    return $self;
}

# only the format can be changed
sub format {
    my ($self, $format) = @_;

    if ($format) {
        $self->{format} = $format;
    }

    return $self->{format};
}

# the string conversion for this class
sub date_to_string {
    my $self = shift;
    my $format = shift || $self->{format};

    my $string;
    SWITCH: foreach ($self->{format}) {
        /^US/ and do {
            $string = sprintf "%02d/%02d/%4d", $self->{month}, $self->{day},
                      $self->{year};
            last;
        };
   
        /^GB/ and do {
            $string = sprintf "%02d/%02d/%4d", $self->{day}, $self->{month},
                      $self->{year};
            last;
        };
   
        # universal format
        $string = sprintf "%4d/%02d/%02d",
        $self->{year}, $self->{month}, $self->{day};
    }
    $string .= " ($self->{format})";
}

# overload the operator to use convertor
use overload '""' => \&date_to_string;

1;
