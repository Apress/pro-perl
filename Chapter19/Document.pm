# Document.pm (p727,p729)
# (this module is used by document.pl, additional)
package Document;
use strict;

# scalar constructor
sub new {
    my $class = shift;

    my $self;
    if (my $fh = shift) {
        local $/ = undef;
        $$self = <$fh>;
    }

    return bless $self, $class;
}

# (p729)
# search a document object
sub search {
    my ($self, $pattern) = @_;

    my @matches = $$self =~ /$pattern/sg;
    return @matches;
}
# search and return words
sub wordsearch {
    my ($self, $wordbit) = @_;

    my $pattern = '\b\w*'.$wordbit.'\w*\b';
    return $self->search($pattern);
}

# extended example - rendering the document
use overload '""' => 'toString';
sub toString { return ${$_[0]}; }

1;
