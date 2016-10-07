#!/usr/bin/perl
# namedorlistargs.pl (p220-221)
use strict;
use warnings;

sub volume {
    my %param;

    if ($_[0]=~/^-/) {
        # if the first argument starts '-', assume named arguments
        while (@_) {
            my ($key, $value)=(shift, shift);
            $key =~ s/^-//;   #remove leading minus
            $param{$key} = $value;
        }

    } else {
        # no '-' on first argument - assume list arguments
        $param{height} = shift;
        $param{width} = shift;
        $param{length} = shift;
    }

    # default any unspecified dimensions to 1
    foreach ('height', 'width', 'length') {
        unless (defined $param{$_}) {
            warn "Undefined $_, assuming 1";
            $param{$_} = 1;
        }
    }

    return abs($param{height} * $param{width} * $param{length});
}

print volume(2,5,10),"\n";
print volume(-height=>2,-width=>5,-length=>10),"\n";

# define some default parameters
my %default = (-height => 1, -width => 4, -length => 9);

# use default
print volume(%default);

# override default
print volume(%default, -length => 16);
print volume(%default, -width => 6, -length => 10);

# specify additional parameters
print volume(%default, -color => "red", -density => "13.4");
