/* Heavy/Fraction.xs (p833,p834,p835,p836,p837,p838,p840) */
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "const-c.inc"

/* (p834) */
int heavyfraction (int num1, int num2)
{
    int result;

    if (num1 > num2) {
        result = num1 / num2;
    } else {
        result = num2 / num1;
    }

    return result;
}

/* (additional, p836) */
void convert_int (int input, int *output)
{
    *output = input * 2;
}

/* (additional, p842) */
typedef unsigned int percent;

MODULE = Heavy::Fraction		PACKAGE = Heavy::Fraction		

INCLUDE: const-xs.inc

# (p834)
int
heavyfraction(num1, num2)
    int num1
    int num2

#---

# (p834-835)
int
heavyfraction2(num1, num2)
    int num1
    int num2
CODE:
    if (num1 > num2) {
        RETVAL = num1 / num2;
    } else {
        RETVAL = num2 / num1;
    }
OUTPUT:
    RETVAL

#---

# (p835)
int
difference(num1, num2)
    int num1
    int num2
PREINIT:
    int delta;
CODE:
    delta = abs(num1 - num2);
    RETVAL = delta;
OUTPUT:
    RETVAL

#---

# (p835-836)
int countdown_list(from=10, to=0)
    int from
    int to
PREINIT:
    int delta, i;
PPCODE:
    if (to < from) {
        delta = from - to + 1;
        EXTEND(SP, delta);
        for (i=from; i>=to; i--) {
            XST_mIV(from - i,i);
        }
        XSRETURN(delta);
    } else {
        XSRETURN_UNDEF;
    }

#---

# (p836)
void
convert_int(input, output)
    int input
    int &output = NO_INIT
OUTPUT:
    output 

int
convert_int2(input)
    int input
CODE:
    convert_int(input, &RETVAL);
OUTPUT:
    RETVAL

#---

# (p837)
int
countdown_list2(from=10, to=0)
    int from
    int to
PREINIT:
    int delta, i;
PPCODE:
    if (GIMME_V == G_VOID) XSRETURN_UNDEF;

    if (to < from) {
        delta = from - to + 1;
        if (GIMME_V == G_ARRAY) {
            EXTEND(SP, delta);
            for (i=from; i>=to; i--) {
                XST_mIV(from-i, i);
            }
            XSRETURN(delta);
        } else { /* G_SCALAR */
            AV* array=newAV();
            for (i=from; i>=to; i--) {
                av_push(array, newSViv(i));
            }
            XPUSHs(sv_2mortal(newRV_noinc((SV*)array)));
            XSRETURN(1);
        }
    } else {
        XSRETURN_UNDEF;
    }

#---

# (p838)
int
count_down(message, from=10, to=0)
    int from
    int to
PREINIT:
    int i;
CODE:
    if (to < from) {
        for (i=from; i>=to; i--) {
            printf("%d...\n",i);
        }
        printf("Liftoff!\n");
        RETVAL = 0; /*launched ok*/
    } else {
        RETVAL = 1; /*abort, can't count*/
    }
OUTPUT:
    RETVAL

#---

# (p838)
int
average(...)
PREINIT:
    int argno;
CODE:
    RETVAL = 0;
    for (argno=0; argno<items; argno++) {
        RETVAL += SvIV(ST(argno));
    }
    RETVAL = RETVAL / items;
OUTPUT:
    RETVAL

#---

# (p840)
SV *
positive_or_undef(in)
    SV *in
CODE:
    if (SvIV(in) < 0) {
        RETVAL = &PL_sv_undef;
    } else {
        SvREFCNT_inc(in);
        RETVAL = in;
    }
OUTPUT:
    RETVAL

#---

# (additional, use of 'percent' type, p842-843)
percent
percentage(a,b)
    int a
    int b
CODE:
    if (a < b) {
        RETVAL = (100 * a) / b;
    } else {
        RETVAL = 0;
    }
OUTPUT:
    RETVAL
