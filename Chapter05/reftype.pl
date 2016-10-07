#!/usr/bin/perl
# reftype.pl (p140)
use warnings;
use strict;

use Scalar::Util qw(reftype);

die "Usage: $0 <object module> ...\n" unless @ARGV;

foreach (@ARGV) {
    my $filename = $_;
    $filename =~ s|::|/|g;
    require "$filename.pm";
    my $obj = new $_;

    print "Object class ", ref($obj),
          " uses underlying data type ", reftype($obj), "\n";
}
