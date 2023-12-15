SHEETBUILDER = src/main.cpp src/SheetBuilder.cpp  #src/daw.cpp 
MODSYN       = src/modsyn/main.cpp src/modsyn/synmod.cpp 
TESTSHEETBUILDER         = test/src/main.cpp test/src/TestSheetBuilder.cpp src/SheetBuilder.cpp 

CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CPPUNIT = -lcppunit
CC	= g++

sheetbuilder: $(SHEETBUILDER) 
	$(CC) $(SHEETBUILDER) -o ~/mmw/bin/sheetbuilder

testsheetbuilder: $(TESTSHEETBUILDER ) 
	$(CC) -o ~/mmw/bin/testsheetbuilder $(TESTSHEETBUILDER) $(CPPUNIT)

modsyn: $(MODSYN) 
	$(CC) $(MODSYN) -o ~/mmw/bin/modsyn



