PROG	= src/main.cpp src/SheetBuilder.cpp  #src/daw.cpp 
TEST    = test/src/test.cpp

CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CPPUNIT = -lcppunit
CC	= g++

sheetbuilder: $(PROG) 
	$(CC) $(PROG) -o ~/mmw/bin/sheetbuilder

sheetbuildertest: $(TEST) 
	$(CC) $(TEST) -o ~/mmw/bin/sheetbuildertest $(CPPUNIT)

#daw: $(PROG)
#	$(CC) $(INCLUDE) $(PROG) $(CSOUND) -o ~/mmw/bin/daw
