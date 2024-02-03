SHEETBUILDER      = src/main.cpp src/SheetBuilder.cpp   
MODSYN            = src/modsyn/main.cpp src/modsyn/modsyn.cpp 
TESTSHEETBUILDER  = test/src/testsheetbuilder/main.cpp test/src/testsheetbuilder/TestSheetBuilder.cpp src/SheetBuilder.cpp 
TESTMODSYN        = test/src/testmodsyn/main.cpp  test/src/testmodsyn/TestModSyn.cpp src/modsyn/modsyn.cpp

CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CPPUNIT = -lcppunit
CC	= g++

all: sheetbuilder testsheetbuilder modsyn testmodsyn

sheetbuilder: $(SHEETBUILDER) 
	$(CC) $(SHEETBUILDER) -o ~/mmw/bin/sheetbuilder

testsheetbuilder: $(TESTSHEETBUILDER ) 
	$(CC) -o ~/mmw/bin/testsheetbuilder $(TESTSHEETBUILDER) $(CPPUNIT)

modsyn: $(MODSYN) 
	$(CC) $(MODSYN) -o ~/mmw/bin/modsyn

testmodsyn: $(TESTMODSYN) 
	$(CC) $(TESTMODSYN) -o ~/mmw/bin/testmodsyn $(CPPUNIT)

clean:
	rm -f ~/mmw/bin/sheetbuilder
	rm -f ~/mmw/bin/testsheetbuilder
	rm -f ~/mmw/bin/modsyn
	rm -f ~/mmw/bin/testmodsy
