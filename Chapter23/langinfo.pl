#!/usr/bin/perl
# langinfo.pl (p983-984)
use strict;
use warnings;
use I18N::Langinfo qw(
    /DAY/ /MON/
    YESSTR NOSTR YESEXPR NOEXPR CODESET
    langinfo
);

print "Code set = ",langinfo(CODESET),"\n";
print "Yes='",langinfo(YESSTR),"' regex='",langinfo(YESEXPR),"'\n";
print " No='",langinfo(NOSTR) ,"' regex='",langinfo(NOEXPR),"'\n";

no strict 'refs';
foreach my $day (1..7) {
    eval { print "Day $day is ", langinfo(&{'DAY_'.$day}),
      " (",langinfo(&{'ABDAY_'.$day}),")\n";
    } 
}
foreach my $month (1..12) {
    eval { print "Month $month is ", langinfo(&{'MON_'.$month}),
      " (",langinfo(&{'ABMON_'.$month}),")\n";
    }
}
