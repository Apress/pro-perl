#!/usr/bin/perl
# semaphore.pl (p902-903)
use warnings;
use strict;

use threads;
use Thread::Semaphore;

my $threads = 3;   # number of service threads to create
my $line : shared = "";   # input line

my $main = new Thread::Semaphore;    # proceed semaphore, initial value 1
my $next = new Thread::Semaphore(0); # new line semaphore, initial value 0

# a locked print subroutine - stops thread output mingling
{ my $lock : shared;
  sub thr_print {
      lock $lock;
      print @_;
  }
}

# create a pool of three service threads
foreach (1..$threads) {
    threads->create(\&process_thing);
}

# main loop: read a line, raise 'next' semaphore to indicate a line is
# available, then wait for whichever thread lowered the 'next' semaphore
# to raise the 'main' semaphore, indicating we can continue.
while ($line = <>) {
    chomp $line;
    thr_print "Main thread got '$line'\n";

    # notify service threads that a new line is ready
    $next->up;
    thr_print "Main thread set new line semaphore, waiting to proceed\n";

    # do not proceed until value has been retrieved by responding thread
    $main->down;
    thr_print "Main thread received instruction to proceed\n";
}

thr_print "All lines processed, sending end signal\n";

# set the line to special value 'undef' to indicate end of input
$line = undef;
# to terminate all threads, raise 'new line' semaphore to >= number of
# service threads: all service threads will decrement it and read the
# 'undef'
$next->up($threads);
threads->join($_) foreach threads->list();
thr_print "Main thread ended\n";
exit 0;

# the thread subroutine - block on lock variable until work arrives
sub process_thing {
    my $self = threads->self;
    my $thread_line;

    thr_print "Thread ", $self->tid, " started\n";
    while (1) {
        # try to decrement 'next' semaphore - winning thread gets line
        thr_print "Thread ", $self->tid, " waiting\n";
        $next->down;

        # retrieve value to process
        thr_print "Thread ", $self->tid, " signalled\n";
        $thread_line = $line;

        # was this the 'quit' signal? Check the value sent
        last unless (defined $thread_line);

        # let main thread know we have got the value
        thr_print "Thread ", $self->tid, " retrieved data, signaling main\n";
        $main->up;

        # do private spurious things to it
        chomp ($thread_line=uc($thread_line));
        thr_print "Thread ", $self->tid, " got '$thread_line'\n";
    }
    thr_print "Thread ", $self->tid, " ended\n";
}
