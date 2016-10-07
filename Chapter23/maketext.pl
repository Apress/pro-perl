#!/usr/bin/perl
# maketext.pl (p987, adapted from extended examples)
use warnings;
use strict;

use My::Application::I18N;

My::Application::I18N->fallback_languages("en-us","en");

my $lexicon=My::Application::I18N->get_handle();
die "No language support available!\n"
  unless $lexicon;

print $lexicon->maketext("Welcome"),"\n"; #defined in en, en_us and fr
print $lexicon->maketext(found_results => 16,'Perl'),"\n"; #only in en
