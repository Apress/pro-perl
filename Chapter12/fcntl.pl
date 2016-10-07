#!/usr/bin/perl
# fcntl.pl (441)
use warnings;
use strict;

use Fcntl;
# generic lock subroutine
sub _do_lock {
    my ($locktype, $fh, $block) = @_;
    $block |= 0; # don't block unless asked to

    # is this a blocking or nonblocking attempt
    my $op = $block?F_SETLKW:F_SETLK;

    # pack a structure suitable for this operation
    my $lock = pack('s s l l s', $locktype, 0, 0, 0, 0);

    # establish the chosen lock in the chosen way
    my $res = fcntl($fh, $op, $lock);
    seek($fh, 0, 0);
    return $res;
}

# specific lock types
sub read_lock { return _do_lock(F_RDLCK, @_); }
sub write_lock { return _do_lock(F_WRLCK, @_); }
sub undo_lock { return _do_lock(F_UNLCK, @_); }

# called like this:
open MYHANDLE, "+> myfile" or die "Failed to open: $! \n";

# block write lock
write_lock(*MYHANDLE, 1) or die "Failed to lock: $! \n";

print MYHANDLE "Only I can write here \n";
# undo (can''t block anyway)
undo_lock(*MYHANDLE) or die "Failed to unlick: $! \n";
close MYHANDLE;
