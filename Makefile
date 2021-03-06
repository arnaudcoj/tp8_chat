CC      = gcc -pthread
CFLAGS  = -Wall -ansi -pedantic
CFLAGS += -D_XOPEN_SOURCE=500
CFLAGS += -DDEBUG
CFLAGS += -g

BINARIES = 	mtcs
OBJECTS = 	mtcs.o tools.o cnct.o stat.o

all : $(BINARIES) $(OBJECTS)

###------------------------------
### Entries
###------------------------------------------------------------
mtcs : $(OBJECTS)
	$(CC) -o $@ $^

###------------------------------
### Dependencies
###------------------------------------------------------------
# thanks to 'make depend'
cnct.o: cnct.c config.h tools.h cnct.h
mtcs.o: mtcs.c tools.h config.h cnct.h stat.h
tools.o: tools.c tools.h
stat.o: stat.c

###------------------------------
### Misc.
###------------------------------------------------------------
.PHONY: clean realclean depend
clean::
	$(RM) $(BINARIES)
realclean:: clean
	$(RM) $(OBJECTS) $(TRASHFILES)
depend:
	$(CC) $(CFLAGS) -MM *.c

