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

void
TestSheetBuilder::testAddition(void)
{
    //CPPUNIT_ASSERT(5 == mTestObj->Addition(2,3));
}

void
TestSheetBuilder::testMultiply(void)
{
    //CPPUNIT_ASSERT(6 == mTestObj->Multiply(2,3));
}

void
TestSheetBuilder::testPrintStaff(void){

  // Create a temporary file to capture the output
  const char* tempFileName = "temp_staff_output.ly";
  FILE* tempFile = fopen(tempFileName, "w");
  
  CPPUNIT_ASSERT(tempFile != nullptr);  // Check if the file was created
  
  // Define a sample STAFF structure (replace with your actual data)
  STAFF staff;
  strcpy(staff.instr, "Bass");
  strcpy(staff.time, "4/4");
  staff.tempo, "Allegro";
  staff.clef, "treble";
  staff.key, "C";
  staff.mode, "major";

  // Call your printStaff function
  SheetBuilder sheetBuilder;
  //FILE* sheet = fopen("test_sheet.ly", "w");
  //sheetBuilder.printStaff(staff, sheet);
  //fclose(sheet);
}

void TestSheetBuilder::setUp(void){
  sheetBuilder= SheetBuilder();
}

void TestSheetBuilder::tearDown(void)
{
    //delete mTestObj;
}
