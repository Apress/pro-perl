#!/perl/bin/perl
# win32.pl (p592)
use Win32::EventLog;
use strict;

my $e = new Win32::EventLog($0);
my %hash = (
    Computer  => $ENV{COMPUTERNAME},
    EventType => EVENTLOG_ERROR_TYPE,
    Category  => 42,
    Data      => "Data about this error",
    Strings   => "this is a test error"
);
$e->Report(\%hash);
