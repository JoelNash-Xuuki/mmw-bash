PROG	= src/main.cpp src/SheetBuilder.cpp  #src/daw.cpp 
TEST    = test/src/main.cpp test/src/TestBasicMath.cpp #test/src/TestSheetBuilder.cpp test/src/main.cpp 

CSOUND  = -lcsound64 -lcsnd6
INCLUDE = -I/usr/include/csound/
CPPUNIT = -lcppunit
CC	= g++

sheetbuilder: $(PROG) 
	$(CC) $(PROG) -o ~/mmw/bin/sheetbuilder

test: $(TEST) 
	$(CC) $(TEST) -o ~/mmw/bin/sheetbuildertest $(CPPUNIT)

#daw: $(PROG)
#	$(CC) $(INCLUDE) $(PROG) $(CSOUND) -o ~/mmw/bin/daw

CXX = g++
INCLUDES= -I./
CXXFLAGS = -g $(INCLUDES)
SRCM= src/CBasicMath.cpp
OBJM = $(SRCM:.cpp=.o)
LINKFLAGS= -lcppunit

testbasicmath: $(TEST) $(OBJM)
	$(CXX) $(CXXFLAGS) -o ~/mmw/bin/testbasicmath $(TEST) $(OBJM) $(LINKFLAGS) $(LINKFLAGSLOG4) $(LIBLOG)

# Default compile

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@
