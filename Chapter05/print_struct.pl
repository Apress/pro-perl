#!/usr/bin/perl
# print_struct.pl (p151)
use warnings;
use strict;

my $mixed = [
    'scalar', ['a', 'list', ['of', 'many'], 'values'],
    {And=>{'A Hash'=>'Of Hashes'}}, \'plus a scalar ref'
];

print_structure($mixed);

sub print_structure {
    my ($data, $depth) = @_;

    $depth=0 unless defined $depth; #for initial call

    foreach (ref $data) {
        /^$/ and print($data,"\n"), next;
        /^SCALAR/ and print('-> ', $$data, "\n"), next;
        /^HASH/ and do {
            print "\n";
            foreach my $key (keys %{$data}) {
                print "\t" x$depth, "$key => ";
                print_structure ($data->{$key}, $depth+1);
            }
            next;
        };
        /^ARRAY/ and do {
            print "\n";
            for my $elc (0..$#{$data}) {
                print "\t" x$depth, "[$elc] : ";
                print_structure ($data->[$elc], $depth+1);
            }
            next;
        };
        # it is something else - an object, filehandle or typeglob
        print "?$data?";
    }
}
