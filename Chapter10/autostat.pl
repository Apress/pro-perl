#!/usr/bin/perl
# autostat.pl (p287-288)
use warnings;
use strict;

use Carp;

sub AUTOLOAD {
    our $AUTOLOAD;

    my $result;
    SWITCH: foreach ($AUTOLOAD) {
        /sum/ and do {
            $result = 0;
            map { $result+= $_ } @_;
            last;
        };
        /average/ and do {
            $result = 0;
            map { $result+= $_ } @_;
            $result/=scalar(@_);
            last;
        };
        /biggest/ and do {
            $result = shift;
            map { $result = ($_ > $result)?$_:$result } @_;
            last;
        };
        /smallest/ and do {
            $result = shift;
            map { $result = ($_ < $result)?$_:$result } @_;
            last;
        }
    }

    croak "Undefined subroutine $AUTOLOAD called" unless defined $result;
    return $result;
}

my @values = (1,4,9,16,25,36);
print "Sum: ",sum(@values),"\n";
print "Average: ",average(@values),"\n";
print "Biggest: ",biggest(@values),"\n";
print "Smallest: ",smallest(@values),"\n";
print "Oddest: ",oddest(@values),"\n";
