#!/usr/bin/perl
# curses2.pl (p569)
use warnings;
use strict;

use Curses;

# create a 3x20 window with top corner at 0,0
my $window = new Curses(3, 20, 0, 0);

cbreak();    # go into 'cbreak' mode
noecho();    # prevent key presses echoing
curs_set(0); # hide the cursor

# define some colors
start_color();
init_pair(1,COLOR_YELLOW,COLOR_BLUE);
init_pair(2,COLOR_GREEN,COLOR_BLUE);
# put something in the window
$window->attron(COLOR_PAIR(1));
$window->clear();
$window->box(0,0);
$window->attron(COLOR_PAIR(2));
$window->addstr(1, 1, " This is a Window ");
$window->attroff(COLOR_PAIR(2));

$window->refresh();
getch;

foreach (5..25) {
    $window->mvwin($_, $_);
    $window->refresh();
    last if (lc(getch) eq 'q');
}

END { endwin; }   # end Curses properly even on abnormal termination
