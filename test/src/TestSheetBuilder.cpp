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
TestSheetBuilder::defineStaffStructure(void){
  //strcpy(this->staff.instr, "Actual_Staff");
  //strcpy(this->staff.time, "4/4");
  //strcpy(this->staff.tempo, "Allegro");
  //strcpy(this->staff.clef, "treble");
  //strcpy(this->staff.key, "C");
  //strcpy(this->staff.mode, "major");
}

void
TestSheetBuilder::testPrintStaff(void){

  //sheetBuilder.printStaff(staff);
  

  //this->testSheet = fopen("/home/joel/mmw/test/src/Test_Sheet.ly", "r");
  //this->expectedSheet = fopen("/home/joel/mmw/test/src/Expected_Sheet.ly", "r"); 

  //CPPUNIT_ASSERT(6 == mTestObj->Multiply(2,3));
}

void
TestSheetBuilder::canReadPatchFileStaffGroupsAndStaffCount(void){
  sheetBuilder.readPatchFile();
  // Assert the expected results
  //CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffGroupCount());
  //CPPUNIT_ASSERT_EQUAL(1, sheetBuilder.getStaffCount());
}

void TestSheetBuilder::setUp(void){
  const char* sheetName= "Test_Sheet.ly";
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

  //this->testSheet = fopen("/home/joel/mmw/test/src/Test_Sheet.ly", "w");
}

void TestSheetBuilder::tearDown(void)
{
    //delete mTestObj;
}

//#include <cppunit/extensions/HelperMacros.h>
//#include <cstdlib>
//
//class MyTest : public CppUnit::TestFixture {
//    CPPUNIT_TEST_SUITE(MyTest);
//    CPPUNIT_TEST(testVariable);
//    CPPUNIT_TEST_SUITE_END();
//
//public:
//    void testVariable() {
//        const char* envVar = std::getenv("JOEL_HOME");
//        if (envVar != nullptr) {
//            std::string joelHome(envVar);
//            // Use the value of JOEL_HOME variable in your test
//            // ...
//        } else {
//            // Handle the case when JOEL_HOME is not set
//            // ...
//        }
//    }
//};
//
//CPPUNIT_TEST_SUITE_REGISTRATION(MyTest);
//
