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
#include "TestModSyn.hpp"

using namespace CppUnit;
using namespace std;

void TestModSyn::setUp(void){
  const char* patch= "/home/joel/projects_/patches/mpatch4";
  const char* name= "/home/joel//mmw/test/src/sound-design/test.csd";
  this->modsyn= ModSyn(patch,name);
}

void TestModSyn::canReadPatch(void){
  this->modsyn.processPatch(); 
  CPPUNIT_ASSERT(this->modsyn.compareFiles(
    "/home/joel/mmw/test/src/sound-design/test.csd",
    "/home/joel/mmw/test/src/sound-design/expected_test.csd"));
}

void TestModSyn::tearDown(void){
    //delete this->sheetBuilder;
}
