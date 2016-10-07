# My/AutoModule.pm (p293)
# (this module is used by automoduletest.pl, p294)

package My::AutoModule;

use strict;
use Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);
our @EXPORT = qw(one two three);

sub one {
    print "This is always compiled\n";
}

1;

__END__

sub two {
    print "This is sub two\n";
}

sub three {
    print "This is sub three\n";
}
