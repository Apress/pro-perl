# ErrorClass/Overload.pm (p790-791)
package ErrorClass;
use strict;
use ErrorClass;

use overload (
    '""' => \&error_to_string,
    '0+' => \&error_to_number,
    fallback => 1,
);

sub error_to_string {
    my $class = (ref $_[0]) || $_[0];
    my $package = __PACKAGE__;
    $class =~ /$package\:\:(\w+)/ and return $1;
}

sub error_to_number {
    return shift->number;
}

1;
