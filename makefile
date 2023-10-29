PROG	= src/main.cpp src/SheetBuilder.cpp  #src/daw.cpp 
CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CC	= g++

sheetbuilder: $(PROG) 
	$(CC) $(PROG) -o ~/mmw/bin/sheetbuilder


#daw: $(PROG)
#	$(CC) $(INCLUDE) $(PROG) $(CSOUND) -o ~/mmw/bin/daw
