PROG	= src/main.cpp src/modsyn.cpp  #src/daw.cpp 
CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CC	= g++

modsyn: $(PROG) 
	$(CC) $(PROG) -o ~/mmw/bin/modsyn


#daw: $(PROG)
#	$(CC) $(INCLUDE) $(PROG) $(CSOUND) -o ~/mmw/bin/daw
