#!/usr/bin/perl
# threadpool.pl (p898-900)
use warnings;
use strict;

use threads;
use threads::shared;

my $threads = 3; # number of service threads to create
my $line : shared= "";
                 # parent lock variable and input line set to "" here, we
                 # assign each new line of input to it, and set it to 'undef'
                 # when we are finished to tell service threads to quit
my $pool : shared = 0;
                 # child lock variable and pool counter set to 0 here,
                 # service threads increment it when they are ready for input

# a locked print subroutine ? stops thread output mingling
{
  my $lock : shared;
  sub thr_print {
      lock $lock;
      print @_;
  }
}

# create a pool of three service threads
foreach (1..$threads) {
    threads->create(\&process_thing);
}

# main loop: Read a line, wait for a service thread to become available,
# signal that a new line is ready, then wait for whichever thread picked
# up the line to signal to continue
while ($line = <>) {
    chomp $line;
    thr_print "Main thread got '$line'\n";

    # do not signal until at least one thread is ready
    if ($pool==0) {
        thr_print "Main thread has no service threads available, yielding\n";
        threads->yield until $pool>0;
    }
    thr_print "Main thread has $pool service threads available\n";

    # signal that a new line is ready
    {
        lock $pool;
        cond_signal $pool;
    }
    thr_print "Main thread sent signal, waiting to be signaled\n";
    # wait for whichever thread wakes up to signal us
    {
        lock $line;
        cond_wait $line;
    }
    thr_print "Main thread received signal, reading next line\n";
}

thr_print "All lines processed, sending end signal\n";
# set the line to special value 'undef' to indicate end of input
$line = undef;
{
    lock $pool;
    # tell all threads to pick up this 'line' so they all quit
    cond_broadcast $pool;
}
threads->join($_) foreach threads->list();
thr_print "Main thread ended\n";
exit 0;

# the thread subroutine ? block on lock variable until work arrives
sub process_thing {
    my $self=threads->self;
    my $thread_line;

    thr_print "Thread ",$self->tid," started\n";
    while (1) {
        # has the 'quit' signal been sent while we were busy?
        last unless (defined $line);

        # wait to be woken up
        thr_print "Thread ",$self->tid," waiting\n";
        {
            lock $pool;
            $pool++;
            cond_wait $pool; #all threads wait here for signal
            $pool--;
        }

        # retrieve value to process
        thr_print "Thread ",$self->tid," signaled\n";
        $thread_line = $line;

        # was this the 'quit' signal? Check the value sent
        last unless (defined $thread_line);

        # let main thread know we have got the value
        thr_print "Thread ",$self->tid," retrieved data, signaling main\n";
        {
            lock $line;
            cond_signal $line;
        }

        # do private spurious things to it
        chomp ($thread_line=uc($thread_line));
        thr_print "Thread ",$self->tid," got '$thread_line'\n";
    }
    thr_print "Thread ",$self->tid," ended\n";
}
