# Uninstallable.pm (p299)
# (this module is used by uninstall.pl, p299)
package Uninstallable;

use Symbol qw(delete_package);

our $message = "I'm here\n"; # package global

sub unimport {
    delete_package(__PACKAGE__);
}

1;
