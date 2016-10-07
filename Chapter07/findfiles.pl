#!/usr/bin/perl
# findfiles.pl (p232)
use warnings;
use strict;
my $files = list_files ($ARGV[0]);

if (defined $files) {
    if ($files) {
        print "Found: $files \n";
    } else {
        print "No files found \n";
    }
} else {
    print "No path specified\n";
}

sub list_files {
    my $path = shift;

    return undef unless defined $path;  #return undef if no path
    return join(',', glob "$path/*");   #return comma separated string
}
