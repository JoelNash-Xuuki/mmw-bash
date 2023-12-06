#include <iostream>
#include <string>
#include <list>
#include <cppunit/TestCase.h>
#include <cppunit/TestFixture.h>
#include <cppunit/ui/text/TextTestRunner.h>
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/TestResult.h>
#include <cppunit/TestResultCollector.h>
#include <cppunit/TestRunner.h>
#include <cppunit/BriefTestProgressListener.h>
#include <cppunit/CompilerOutputter.h>
#include <cppunit/XmlOutputter.h>
#include <netinet/in.h>
#include "TestSheetBuilder.hpp"

using namespace CppUnit;
using namespace std;

void TestSheetBuilder::setUp(void){
  const char* sheetName= "/home/joel/mmw/test/src/Test_Sheet";
  const char* service= "Xuuki";
  const char* title= "Title";
  const char* artist= "Vyvn";
  const char* patchName= "patchName";
  const char* sheetLocation= "/home/joel/mmw/test/src/";

  this->sheetBuilder= SheetBuilder(sheetName,
                             service,
                             title,
                             artist,
			     patchName,
			     sheetLocation);
}

void TestSheetBuilder::canPrintScoreHeader(void){
  this->sheetBuilder.printHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Header.partial.ly", 
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Header.ly"));
}

void TestSheetBuilder::canReadPatchFileStaffGroupsStaffCountAndNoteCount(void){
  sheetBuilder.readPatchFile();
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffGroupCount());
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffCount());
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getNoteCount());
}

void TestSheetBuilder::canPrintStaffGroupHeader(void){
  this->sheetBuilder.setStaffGroupCount(1);
  this->sheetBuilder.printStaffGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Staff_Group_Header.ly",
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_Group_Header.ly"));
}

void TestSheetBuilder::canPrintStaffInGroup(void){
  this->staff= (STAFF *)malloc(MAXMODS * sizeof(STAFF));
  this->sheetBuilder.readPatchFile();
  int count= 2; 
  for (count; count > 0; count--){
    this->staff[count].sheet = fopen(("/home/joel/mmw/test/src/Test_Sheet_Staff_" + 
	                              to_string(count) + ".partial.ly").c_str(), "w");
    strcpy(this->staff[count].instr, "Bass");
    strcpy(this->staff[count].time, "4/4");
    strcpy(this->staff[count].tempo, "84");
    strcpy(this->staff[count].clef, "Bass");
    strcpy(this->staff[count].key, "a");
    strcpy(this->staff[count].mode, "major");

    this->sheetBuilder.printStaffInGroup(this->staff, count);
  }
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
                 "/home/joel/mmw/test/src/Test_Sheet_Staff_1.partial.ly",
                 "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_1.partial.ly"));
}

void TestSheetBuilder::tearDown(void){
    //delete this->sheetBuilder;
}
