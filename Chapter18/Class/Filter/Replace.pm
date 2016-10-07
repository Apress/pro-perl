# Class/Filter/Replace.pm (p696)
# (this module is used by classfilter.pl, p696)
package Class::Filter::Replace;
use strict;
use Carp qw(croak);
use Filter::Util::Call;

sub import {
    my ($self,$replace,$with)=@_;
    unless ($replace) {
        croak("use ".__PACKAGE__." 'original' [, 'replacement'];");
    }
    $with ||= ""; #replace with nothing

    my $filter={
        replace => $replace,
        with    => $with,
    };

    filter_add($filter);
}

sub filter {
    my $status=filter_read(); # set $_ from input
    s/$_[0]->{replace}/$_[0]->{with}/go if $status > 0;
    return $status; # 0 = end of file, <0 = error
}

1;
