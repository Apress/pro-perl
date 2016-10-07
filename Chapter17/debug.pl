#!/usr/bin/perl
# debug.pl (p596)
use warnings;
use strict;

# define a debugging infrastructure
{ my $debug_level = $ENV{DEBUG};
  $debug_level |= 0;   # set to 0 if undefined

  # return, and optionally set, debug level
  sub debug_level (;$) {
      $debug_level = $_[0] if @_;
      return $debug_level;
  }
  # print debug message or set debug level
  sub debug (;$@) {
      # remove first argument (if present)
      my $level = shift;
  
      # @_ will contain more elements if 2+ arguments were passed
      if (@_) {
          # 2+ argument calls print debug message if permitted
          print STDERR @_, "\n" if $level <= debug_level();
      } else {
          # one and no-argument calls set level
          debug_level($level?$level:1);
      }
  }
} 

# continuation of debug.pl
# set debugging level explicitly
debug_level(1);

# send some debug messages
debug 1, "This is a level 1 debug message";
debug 2, "This is a level 2 debug message (unseen)";

# change debug level with single argument 'debug'
debug 2;
debug 2, "This is a level 2 debug message (seen)";

# return debugging level programmatically
debug 0, "Debug level is: ", debug_level;

# set debug level to 1 with no argument 'debug'
debug;
debug 0, "Debug level now: ", debug_level;
