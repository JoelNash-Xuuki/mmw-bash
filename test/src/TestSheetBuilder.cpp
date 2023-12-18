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
  const char* sheetLocation= "/home/joel/mmw/test/src/";
  this->sheetBuilder= SheetBuilder(sheetName,
                             service,
                             title,
                             artist,
			     sheetLocation);
}

void TestSheetBuilder::canPrintScoreHeader(void){
  this->sheetBuilder.printHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Header.partial.ly", 
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Header.ly"));
}

void TestSheetBuilder::canReadPatchFileStaffGroupsStaffCountAndNoteCount(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch");
  sheetBuilder.readPatchFile();
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffGroupCount());
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffCount());
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getNoteCount());
}

void TestSheetBuilder::canReadPatchFileOfMultipleStaffGroupsStaffCountAndNoteCount(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-2");
  sheetBuilder.readPatchFile();
  CPPUNIT_ASSERT_EQUAL(2, sheetBuilder.getStaffGroupCount());
  CPPUNIT_ASSERT_EQUAL(2, sheetBuilder.getStaffCount());
  CPPUNIT_ASSERT_EQUAL(2, sheetBuilder.getNoteCount());
}

void TestSheetBuilder::canPrintStaffGroupHeader(void){
  this->sheetBuilder.setStaffGroupCount(1);
  this->sheetBuilder.printStaffGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Staff_Group_Header.ly",
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_Group_Header.ly"));
}

void TestSheetBuilder::canPrintMultipleStaffGroupHeaders(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-2");
  sheetBuilder.readPatchFile();
  this->sheetBuilder.printStaffGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Staff_Group_Header.ly",
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_Group_Header.ly"));
}

void TestSheetBuilder::canPrintStaffInGroupHeader(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch");
  this->sheetBuilder.readPatchFile();
  this->sheetBuilder.printStaffInGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Staff_1.partial.ly",
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_1.partial.ly"));
}

void TestSheetBuilder::canPrintNotesOnStaff(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch");
  this->sheetBuilder.readPatchFile();
  this->sheetBuilder.printAllNotesOnStaff();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Staff_Notes.ly", 
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_Notes.ly"));
}

void TestSheetBuilder::canPrintStaffInGroupCloseBracket(void){
  this->sheetBuilder.printStaffInGroupCloseBracket();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet_Staff_Group_Close_Bracket.ly", 
    "/home/joel/mmw/test/src/Expected_Test_Sheet_Staff_Group_Close_Bracket.ly"));
}

void TestSheetBuilder::canPrintScoreClose(void){
  this->sheetBuilder.printScoreClose();
}

void TestSheetBuilder::canAppendScoreFileSections(void){
  this->sheetBuilder.collectFileSections(); 
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/Test_Sheet.ly",
    "/home/joel/mmw/test/src/Expected_Test_Sheet.ly"));
}

void TestSheetBuilder::tearDown(void){
    //delete this->sheetBuilder;
}
