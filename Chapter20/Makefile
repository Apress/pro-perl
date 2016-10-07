# gmake makefile for all embedded Perl examples (adapted from p817)

CC:=$(shell perl -V::cc:)
CCFLAGS:=$(shell perl -MExtUtils::Embed -e ccopts) -std=c99
LD:=$(shell perl -V::ld:)
LDFLAGS:=$(shell perl -MExtUtils::Embed -e ldopts)

# disable default suffix rules, so they don't interfere
.SUFFIXES:

EXAMPLES = embed embedeval embedarray1 embedarray2 \
           embedhash embednest embedxs embedsplit

all: $(EXAMPLES)

clean:
	rm $(EXAMPLES)

%.o: %.c
	$(CC) $(CCFLAGS) -o $@ -c $?

%: %.o
	$(LD) -o $@ $? $(LDFLAGS)
