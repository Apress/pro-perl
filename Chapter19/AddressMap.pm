# AddressMap.pm (p799)
# (this module is used by addressmap.pl, p799)
use strict;

use Class::Struct;
struct Address => { map {$_ => '$'}
    qw (name house street city state country postcode)
};

1;
