# My/SelfModule.pm (p295-296)

package My::SelfModule;

use strict;
use Exporter;
use SelfLoader;

our @ISA = qw(Exporter);
our @EXPORT = qw(zero one two three);

sub one {
    print "This is always compiled\n";
}

1;

__DATA__

sub two {
    print "This is sub two\n";
}

sub three {
    print "This is sub three\n";
}
