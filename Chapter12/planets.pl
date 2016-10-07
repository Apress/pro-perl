#!/usr/bin/perl
# planets.pl (p400-401)
use warnings;
use strict;

my $columns = <DATA>;
chomp $columns;
my @columns = split /\s*, \s*/, $columns;
shift @columns;   # lose first name

my %table;

while (<DATA>) {
    next if /^#/;   # skip comments
    my @data = split /\s*, \s*/;
    my $name = shift @data;

    foreach (0..$#data) {
        print "$_ : $columns[$_] : $data[$_] \n";
        $table{$name}{$columns[$_]} = $data[$_];
    }
}

foreach (sort keys %table) {
    print "$_\n";
    foreach my $stat (sort keys %{$table{$_}}) {
        print "\t$stat = $table{$_}{$stat}\n";
    }
}
__DATA__
Body    , Radius , Mass    , Distance, Moons, Day        , Year
# The Sun
Sun     , 6.960e8, 1.989e30, 0       , n/a  , 25.36 days , n/a
# The Planets
Mercury , 2.420e6, 3.301e23, 5.791e10, 0    , 58.7 days  , 87.97 days
Venus   , 6.085e6, 4.869e24, 1.082e11, 0    , 243 days   , 224.7 days
Earth   , 6.378e6, 5.978e24, 1.496e11, 1    , 23.93 hours, 365.3 days
Mars    , 3.375e6, 6.420e23, 2.279e11, 2    , 24.6 hours , 687 days
Jupiter , 7.140e7, 1.899e27, 7.783e11, 13   , 9.9 hours  , 11.86 years
Saturn  , 6.040e7, 5.685e26, 1.427e12, 10   , 10.2 hours , 28.46 years
Uranus  , 2.360e7, 8.686e25, 2.869e12, 5    , 10.7 hours , 84.02 years
Neptune , 2.230e7, 1.025e26, 4.498e12, 2    , 15.8 hours , 164.8 years
Pluto   , 3.000e6, 5.000e23, 5.900e12, 1    , 6.3 days   , 248 years
# And the Moon, just for luck
Moon    , 1.738e6, 7.353e22, 1.496e11, n/a  , 27.32 days , 27.32 days

__END__
A comment - this is neither part of the program nor the data (but see below...)

