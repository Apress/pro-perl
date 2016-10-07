# mysrand.pm (p208)
package mysrand;
use strict;

use vars qw(@ISA @EXPORT @EXPORT_OK);
use Exporter;

@ISA = qw(Exporter);
@EXPORT = qw(mysrand);
@EXPORT_OK = qw(srand);

sub mysrand {
    if ($] >= 5.004 and not @_) {
        warn "Unqualified call to srand redundant in Perl $]";
    } else {
        # call the real srand via the CORE package
        CORE::srand @_;
    }
}

use subs qw(srand);
sub srand {&mysrand;}; # pass @_ directly to mysrand

1;
