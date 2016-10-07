#!/usr/bin/perl -w
# whoami.pl (p39)

use English '-no-match-vars';

print 'I am ', $PROGRAM_NAME, ' (', $PROCESS_ID, ')';
#print 'I am ', $0, ' (', $$, ')';
