# StackTrace.pm (p618)
package My::StackTrace;
use strict;
use FileHandle;
require 5.000;


# register the subroutine below as a die handler
$SIG{__DIE__} = 'My::StackTrace::DumpStack';

sub DumpStack {
    my $msg = shift;



    # enable extended argument processing via the debugger hooks
    # built into Perl by accessing DB::args from witin the DB package
    package DB;

    # for inclusion in HTML error documents
    print "<PRE><HR />\n" if $ENV{REMOTE_HOST};
    print "\n$msg\n";

    my $i = 1;
    while (my ($pack,$file,$line,$subname,$hasargs,$wantarray)=caller($i++)) {
        my @args = @DB::args;
        my @tmp = caller($i);

        print "$file:$line ";
        print "(in $tmp[3])" if $tmp[3];

        my $routine = $pack.'::'. $subname;
        print "\n\t&$routine (";

        # for subroutines that convey password data, hide the arguments
        # when dumping the trace, for security.
        if ($hasargs) {
            if ($routine =~/SQL_OpenDatabase/ ||
                $routine =~/RPC::PlClient::new/ ||
                $routine =~/DBD::Proxy::dr::connect/ ||
                $routine =~/DBI::connect/
            ) {
                print scalar(@args)," arguments hidden for security";
            } else {
                print join(", ", @args);
            }
        }
        print ")\n";
    }
    print "\n\n";
    print "<HR /></PRE>\n" if $ENV{"REMOTE_HOST"};

    exit;   # transmute death into a graceful exit
}

1;
