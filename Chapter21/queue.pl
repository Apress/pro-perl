#!/usr/bin/perl
# queue.pl (p905-906)
use warnings;
use strict;

use threads;
use Thread::Queue;
use Thread::Semaphore;

my $threads = 3;   # number of service threads to create
my $maxqueuesize = 5;   # maximum size of queue allowed

my $queue = new Thread::Queue;   # the queue
my $ready = new Thread::Semaphore(0);   # a 'start-gun' semaphore
                                        # initialized to 0 each service
                                        # thread raises it by 1

# a locked print subroutine ? stops thread output mingling
sub thr_print : locked {
   print @_;
}

# create a pool of service threads
foreach (1..$threads) {
   threads->create(\&process_thing, $ready, $queue);
}

# wait for all service threads to increment semaphore
$ready->down($threads);

# main loop: Read a line, queue it, read another, repeat until done
# yield and wait if the queue gets too large.
while (<>) {
   chomp;
   thr_print "Main thread got '$_'\n";

   # stall if we're getting too far ahead of the service threads
   threads->yield while $queue->pending >= $maxqueuesize;

   # queue the new line
   $queue->enqueue($_);
}

thr_print "All lines processed, queuing end signals\n";

# to terminate all threads, send as many 'undef's as there are service
# threads
$queue->enqueue( (undef)x$threads );
threads->join($_) foreach threads->list();
thr_print "Main thread ended\n";
exit 0;

# the thread subroutine - block on lock variable until work arrives
sub process_thing {
   my ($ready,$queue)=@_;

   my $self=threads->self;
   my $thread_line;

   thr_print "Thread ",$self->tid," started\n";
   $ready->up; #indicate that we're ready to go

   while (1) {
      # wait for queue to deliver an item
      thr_print "Thread ",$self->tid," waiting\n";
      my $thread_line=$queue->dequeue();

      # was this the 'quit' signal? Check the value sent
      last unless (defined $thread_line);

      # do private spurious things to it
      chomp ($thread_line=uc($thread_line));
      thr_print "Thread ",$self->tid," got '$thread_line'\n";
   }
   thr_print "Thread ", $self->tid, " ended\n";
}
