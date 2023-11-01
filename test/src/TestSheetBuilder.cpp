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
   
}

void TestSheetBuilder::setUp(void){
    mTestObj= SheetBuilder();
}

void TestSheetBuilder::tearDown(void)
{
    //delete mTestObj;
}
