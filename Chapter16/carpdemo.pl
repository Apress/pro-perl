#!/usr/bin/perl
# carpdemo.pl (p579)
use warnings;

{
    package Top;
    use Carp qw(cluck);
    sub top {
        cluck "Called 'top'";
        Middle->middle();
    }

    package Middle;
    use Carp;
    sub middle {
        carp "Are we there yet? Called 'middle'";
        Bottom->bottom();
    }

    package Bottom;
    use Carp qw(carp confess shortmess);
    #our @CARP_NOT=qw(Middle); #see @CARP_NOT later

    sub bottom {
        shortmess("Here we are");
        carp "Called 'bottom'";
        confess "I did it!";
    }
}

Top->top();
