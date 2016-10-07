#!/usr/bin/perl
# filefindclosure.pl (p477-478)
use strict;
use warnings;
use File::Find;

die "Give me a directory\n" unless @ARGV;

{ # closure for processing File::Find results
    my @results;

    sub wanted { push @results, $File::Find::name }
    sub findfiles {
        @results=();
        find \&wanted, $_[0];
        return @results;
    }
}

foreach my $dir (@ARGV) {
    print("Error: $dir is not a directory\n"), next unless -d $dir;
    my @files=findfiles($dir);
    print "$_ contains @files\n";
}
