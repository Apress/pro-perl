#!/usr/bin/perl
# unbufferedperlio.pl (p438)

binmode(STDOUT,":unix"); #requires PerlIO
for (0..9) {
    print "."; sleep 1;
}
print "\n";
