#!/usr/bin/perl
# langtags.pl (p980)
use strict;
use warnings;

use I18N::LangTags qw(
    implicate_supers
    locale2language_tag 
    is_language_tag
);

# check for valid syntax (does not look up)
print "Tag ok\n" if is_language_tag("fr-CH");

# extract the language tag from a locale - returns 'ru-RU'
print "Tag is ",locale2language_tag("ru_RU.ko18r"), "\n";

# expand a list of tags to include generic supersets
my @expanded=implicate_supers('fr-CH','de-CH');
print "Expanded tags: @expanded\n";
