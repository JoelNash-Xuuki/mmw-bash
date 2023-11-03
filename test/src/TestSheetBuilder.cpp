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
TestSheetBuilder::testPrintStaff(void){

  // Define a sample STAFF structure (replace with your actual data)
  //STAFF staff;
  //strcpy(staff.instr, "Bass");
  //strcpy(staff.time, "4/4");
  //strcpy(staff.tempo, "Allegro");
  //strcpy(staff.clef, "treble");
  //strcpy(staff.key, "C");
  //strcpy(staff.mode, "major");

  //// Call your printStaff function
  //SheetBuilder sheetBuilder;
  //FILE* sheet = fopen("/home/joel/mmw/test/src/test_sheet.ly", "w");
  //sheetBuilder.printStaff(staff, sheet);
  ////fclose(sheet);

  //CPPUNIT_ASSERT(6 == mTestObj->Multiply(2,3));
}

void TestSheetBuilder::setUp(void){
  const char* sheetName= "Test-Sheet.ly";
  const char* service= "Xuuki";
  const char* title= "Title";
  const char* artist= "Vyvn";
  const char* patchName= "patchName";
  const char* sheetLocation= "/home/joel/mmw/test/src/";

  sheetBuilder= SheetBuilder(sheetName,
                             service,
                             title,
                             artist,
			     patchName,
			     sheetLocation);
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
