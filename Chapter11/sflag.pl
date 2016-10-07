#!/usr/bin/perl
# sflag.pl (p364)
# (use file 'sflagfile' as input for this program)
use warnings;
use strict;

undef $/;
my $database = <>;
my @records;

while ($database =~ /item:(.*?)(?=item:|$)/sg) {
    my $record = $1;
    $record =~ s/\n/ /g;
    push @records, $record;
}

print "Got:$_\n" foreach @records;
