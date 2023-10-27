PROG	= src/main.cpp  src/daw.cpp src/modsyn.cpp

CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/

MOD		= src/modsyn.cpp
CC		= g++

modsyn: $(MOD) 
	$(CC) $(MOD) -o ~/mmw/bin/modsyn

#daw: $(PROG)
#	$(CC) $(INCLUDE) $(PROG) $(CSOUND) -o ~/mmw/bin/daw
