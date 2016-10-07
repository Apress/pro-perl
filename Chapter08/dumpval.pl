#!/usr/bin/perl
# dumpval.pl (p258)
use warnings;
use strict;

use Dumpvalue;

# first define some variables
{
    # no warnings to suppress 'usage' messages
    no warnings;

    package World::Climate;
    our $weather = "Variable";

    package World::Country::Climate;
    our %weather = (
        England => 'Cloudy'
    );

    package World::Country::Currency;
    our %currency = (
        England => 'Sterling',
        France => 'Euro',
        Germany => 'Euro',
        USA => 'US Dollar',
    );

    package World::Country::City;
    our @cities = ('London', 'Paris', 'Bremen', 'Phoenix');

    package World::Country::City::Climate;
    our %cities = (
        London => 'Foggy and Cold',
        Paris => 'Warm and Breezy',
        Bremen => 'Intermittent Showers',
        Phoenix => 'Horrifyingly Sunny',
    );

    package World::Country::City::Sights;
    our %sights = (
        London => ('Tower of London','British Museum'),
        Paris => ('Eiffel Tower','The Louvre'),
        Bremen => ('Town Hall','Becks Brewery'),
        Phoenix => ('Arcosanti'),
    );
}

my $dumper = new Dumpvalue (globPrint => 1);
$dumper->dumpValue(\*World::);
