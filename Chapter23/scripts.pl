#!/usr/bin/perl
# scripts.pl (p985)
use strict;
use warnings;
use Locale::Script qw(
    all_script_names script2code
    LOCALE_CODE_ALPHA_2 LOCALE_CODE_ALPHA_3 LOCALE_CODE_NUMERIC 
);

my @scripts = all_script_names();
foreach my $script (sort @scripts) {
    printf "%-37s: 2-letter='%s' 3-letter='%s' numeric='%d'\n", $script,
      script2code($script => LOCALE_CODE_ALPHA_2),
      script2code($script => LOCALE_CODE_ALPHA_3),
      script2code($script => LOCALE_CODE_NUMERIC);
};
