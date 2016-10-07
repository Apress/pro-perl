# Closure/Filter/Replace.pm (p697)
# (this module is used by closurefilter.pl)
package Closure::Filter::Replace;
use strict;
use Carp qw(croak);
use Filter::Util::Call;

sub import {
    my ($self,$replace,$with)=@_;
    croak("use ".__PACKAGE__." 'original' [, 'replacement'];")
      unless $replace;
    $with ="" unless $with;

    my $filter=sub {
        my $status=filter_read(); #populates $_
        s/$replace/$with/g if $status > 0;
        return $status;
    }

    filter_add($filter);
}

1;
