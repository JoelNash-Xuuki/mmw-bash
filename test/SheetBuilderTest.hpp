#include <cstdio>
#include <cstdlib>
#include <string>
#include <cstring>
#define SYNMOD_CHARS (128)
#define MAXMODS (256)

using namespace std;

#ifndef SheetBuilderTest_H
#define SheetBuilderTest_H
class SheetBuilderTest : public CppUnit::TestCase { 
public: 
  SheetBuilderTest( std::string name ) : CppUnit::TestCase( name ) {}
  
  void runTest() {
    CPPUNIT_ASSERT( Complex (10, 1) == Complex (10, 1) );
    CPPUNIT_ASSERT( !(Complex (1, 1) == Complex (2, 2)) );
  }
};

//typedef struct { // STAFFGROUP
//  char name[SYNMOD_CHARS];
//} STAFFGROUP;
//
//typedef struct { // STAFF
//  char instr[SYNMOD_CHARS];
//  char time[SYNMOD_CHARS];
//  char tempo[SYNMOD_CHARS];
//  char clef[SYNMOD_CHARS];
//  char key[SYNMOD_CHARS];
//  char mode[SYNMOD_CHARS];
//} STAFF;

//#ifndef SheetBuilder_H
//#define SheetBuilder_H
//class SheetBuilder{
//  private:
//    FILE *sheet;
//    FILE *patch;
//    STAFFGROUP *staffGroups;
//    STAFF *staffs;
//    int staffGroupCount= 0;
//    int staffCount= 0;
//    const char* service;
//    const char* title;
//    const char* artist;
//    const char* patchName;
//    char modname[64];
//    int i;
//    const char* sheetLocation;
//
//  public:
//    SheetBuilder(const char* sheetName,
//                 const char* service,
//                 const char* title,
//                 const char* artist,
//                 const char* patchName,
//		 const char* sheetLocation);
//    void printHeader(void);
//    void printStaffGroup(STAFFGROUP staffGroup, FILE* sheet);
//    void printStaff(STAFF staff, FILE* sheet);
//    void readStaffGroups(STAFFGROUP *staffGroup, 
//                         int count,  
//                         FILE* sheet);
//    void readStaffs(STAFF *staff, 
//                    int count,  
//                    FILE* sheet);
//    void closeSheet(void);
//};
//# endif
