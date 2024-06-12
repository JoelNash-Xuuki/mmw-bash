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
  const char* sheetName= "/home/joel/mmw/test/src/score/Test_Sheet";
  const char* service= "Xuuki";
  const char* title= "Title";
  const char* artist= "Vyvn";
  const char* sheetLocation= "/home/joel/mmw/test/src/testsheetbuilder";
  this->sheetBuilder= SheetBuilder(sheetName,
                                   service,
                                   title,
                                   artist,
			           sheetLocation);
}

void TestSheetBuilder::canPrintScoreHeader(void){
  this->sheetBuilder.printHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Header.partial.ly", 
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Header.partial.ly"));
}

void TestSheetBuilder::canReadPatchFileStaffGroupsStaffCountAndNoteCount(void){
  sheetBuilder.setPatchFile("/home/joel/mmw/test/testPatch");
  sheetBuilder.readPatchFile();
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffGroupCount());
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffCount());
  CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getNoteCount());
}

void TestSheetBuilder::canReadPatchFileOfMultipleStaffGroupsStaffCountAndNoteCount(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-2");
  sheetBuilder.readPatchFile();
  CPPUNIT_ASSERT_EQUAL(2, sheetBuilder.getStaffGroupCount());
  CPPUNIT_ASSERT_EQUAL(3, sheetBuilder.getStaffCount());
  CPPUNIT_ASSERT_EQUAL(3, sheetBuilder.getNoteCount());
}

void TestSheetBuilder::canPrintStaffGroupHeader(void){
  this->sheetBuilder.setStaffGroupCount(1);
  this->sheetBuilder.printStaffGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Group_Header_1.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Group_Header_1.ly"));
}

void TestSheetBuilder::canPrintMultipleStaffGroupHeaders(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-3");
  sheetBuilder.readPatchFile();
  this->sheetBuilder.printStaffGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Group_Header_1.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Group_Header_1.ly"));
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Group_Header_2.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Group_Header_1.ly"));
}

void TestSheetBuilder::canPrintStaffInGroupHeader(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch");
  this->sheetBuilder.readPatchFile();
  this->sheetBuilder.printStaffInGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_1.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_1.ly"));
}

void TestSheetBuilder::canPrintMultipleStaffInGroupHeader(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-3");
  this->sheetBuilder.readPatchFile();
  this->sheetBuilder.printStaffInGroupHeader();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_1.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_1.ly"));
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_2.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_2.ly"));
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_3.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_3.ly"));
}

void TestSheetBuilder::canPrintNotesOnStaff(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch");
  this->sheetBuilder.readPatchFile();
  this->sheetBuilder.printAllNotesOnStaff();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Notes_1.ly", 
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Notes_1.ly"));
}

void TestSheetBuilder::canPrintMultipleNotesOnStaff(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-3");
  this->sheetBuilder.readPatchFile();
  this->sheetBuilder.printAllNotesOnStaff();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Notes_1.ly", 
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Notes_1.ly"));
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Notes_2.ly", 
     "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Notes_2.ly"));
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Notes_3.ly", 
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Notes_3.ly"));
}

void TestSheetBuilder::canPrintStaffInGroupCloseBracket(void){
  this->sheetBuilder.printStaffInGroupCloseBracket();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Group_Close_Bracket.ly", 
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Group_Close_Bracket.ly"));
}

void TestSheetBuilder::canPrintStaffCloseBracket(void){
  this->sheetBuilder.printStaffCloseBracket();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Staff_Close_Bracket.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Staff_Close_Bracket.ly"));
}

void TestSheetBuilder::canPrintScoreClose(void){
  this->sheetBuilder.printScoreClose();
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet_Close.partial.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet_Close.partial.ly"));
}

void TestSheetBuilder::canAppendScoreFileSections(void){
  sheetBuilder.setPatchFile("/home/joel/projects_/patches/testPatch-3");
  sheetBuilder.readPatchFile();
  this->sheetBuilder.printHeader();
  this->sheetBuilder.collectFileSections(); 
  CPPUNIT_ASSERT(this->sheetBuilder.compareFiles(
    "/home/joel/mmw/test/src/score/Test_Sheet.ly",
    "/home/joel/mmw/test/src/score/Expected_Test_Sheet.ly"));
}

void TestSheetBuilder::tearDown(void){
    //delete this->sheetBuilder;
}

