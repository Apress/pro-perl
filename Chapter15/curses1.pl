#!/usr/bin/perl
# curses1.pl (p567)
use warnings;
use strict;

use Curses;

initscr();   # initialize the screen to use curses
cbreak();   # go into 'cbreak' mode
noecho();   # prevent key presses echoing
# move and addstr as separate actions
attron(A_BOLD|A_UNDERLINE);
move(2,5);
addstr("Environment Variable Definitions:");
attroff(A_BOLD|A_UNDERLINE);
move(15,5);
addstr("Hit a key to continue, 'Q' to finish...");

# enable color
start_color();

# define some color pairs
init_pair(1, COLOR_WHITE,COLOR_BLACK);
init_pair(2, COLOR_YELLOW,COLOR_BLACK);
init_pair(3, COLOR_BLACK,COLOR_CYAN);

OUTER: while (1) {
    foreach (sort keys %ENV) {
       attron(COLOR_PAIR(3));  # set black-on-cyan
       addstr(5,8," $_ ");     # move and write variable name
       clrtoeol();             # delete anything beyond it
       attron(COLOR_PAIR(2));  # set yellow-on-black
       addstr(6,8,$ENV{$_});   # move and write variable value
       clrtoeol();             # delete anything beyond it
       move(9,79);             # move the cursor out of the way
       refresh();              # send output to the screen
       last OUTER if (lc(getch) eq 'q');
   }
}

attron(COLOR_PAIR(1)); # set white-on-black
move(9,5);
addstr("All Done");
refresh();             # send output to the screen

END { endwin; }        # end Curses properly even on abnormal termination
