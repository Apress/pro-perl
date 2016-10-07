/* Module.xs (p833,p834) */
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "const-c.inc"

/* (p843) */
typedef struct {
    int number;
    char *name;
} serial_t;

MODULE = Serial::Module		PACKAGE = Serial::Module

INCLUDE: const-xs.inc

#---

# (p844)
serial_t *
newserial(name,number)
    int number
    char *name
CODE:
    RETVAL = (serial_t *)safemalloc(sizeof(serial_t));
    RETVAL->name = savepv(name);
    RETVAL->number = number;
OUTPUT:
    RETVAL

int
number(serial)
    serial_t *serial;
CODE:
    RETVAL = serial->number;
OUTPUT:
    RETVAL

#---

# (p843-844, additional, test non-ptr Serial)
# (Note that these seem identical to the ptr versions, but actually go)
# (through the T_SERIAL typemaps, so newserial_nonptr uses the OUTPUT mapping
# (for T_SERIAL to return a hash reference. number_nonptr converts a hash)
# (reference into a serial_t using the INPUT mapping for T_SERIAL, then)
# (returns the integer member.)

serial_t
newserial_nonptr(name,number)
    int number
    char *name
CODE:
    RETVAL.name = savepv(name);
    RETVAL.number = number;
OUTPUT:
    RETVAL

int
number_nonptr(serial)
    serial_t serial;
CODE:
    RETVAL = serial.number;
OUTPUT:
    RETVAL
