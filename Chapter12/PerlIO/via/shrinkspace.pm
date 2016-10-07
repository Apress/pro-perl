# PerlIO/via/shrinkspace.pm (p415)
package PerlIO::via::shrinkspace;
use strict;

# layer constructor - return an object of the class
sub PUSHED {
    my ($class,$mode,$fh) = @_;
    my $self = { buffer => '' };
    return bless $self, $class;
}

# input method - read a line from stream and return a processed line
sub FILL {
    my ($self,$fh) = @_;
    my $line = <$fh>;
    # return undef or empty list (depending on context) if at end of file
    return unless defined $line;
    chomp $line;
    $line =~ s/\s+/ /g;
    return $line;
}

# output method - take supplied data and process it outwards
sub WRITE {
    my ($self,$data,$fh) = @_;
    $data =~ s/\s+/ /g;
    $data =~ s/^\s// if $self->{buffer} =~ /\s$/;
    $self->{buffer} .= $data;
    return length($data);
}

# output flush method - actually write data to filehandle
sub FLUSH {
    my ($self,$fh) = @_;
    return -1 unless print $fh $self->{buffer};
    $self->{buffer} = '';
    return 0;
}

1;
