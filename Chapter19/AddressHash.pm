# AddressHash.pm (p797)
package Address;
use strict;

use Class::Struct;

struct Address => {
    name => '$',
    address => '@',
    postcode => '$',
    city => '$',
    state => '$',
    country => '$',
};

1;
