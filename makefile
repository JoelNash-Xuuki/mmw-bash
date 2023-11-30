PROG	= src/main.cpp src/SheetBuilder.cpp  #src/daw.cpp 
TEST    = test/src/main.cpp test/src/TestSheetBuilder.cpp src/SheetBuilder.cpp #test/src/TestBasicMath.cpp  #test/src/main.cpp 

CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CPPUNIT = -lcppunit
CC	= g++

sheetbuilder: $(PROG) 
	$(CC) $(PROG) -o ~/mmw/bin/sheetbuilder

testsheetbuilder: $(TEST) 
	$(CC) -o ~/mmw/bin/testsheetbuilder $(TEST) $(CPPUNIT)

