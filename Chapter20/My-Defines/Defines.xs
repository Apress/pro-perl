#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <defines.h>

#include "const-c.inc"

MODULE = My::Defines		PACKAGE = My::Defines		

INCLUDE: const-xs.inc
