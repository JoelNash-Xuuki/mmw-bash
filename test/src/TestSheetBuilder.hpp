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
#include "../../src/SheetBuilder.hpp"

using namespace CppUnit;
using namespace std;
//-----------------------------------------------------------------------------

class TestSheetBuilder : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE(TestSheetBuilder);
    CPPUNIT_TEST(testPrintStaff);

    CPPUNIT_TEST_SUITE_END();

public:
    void setUp(void);
    void tearDown(void);

protected:
    void testPrintStaff(void);

private:
    SheetBuilder sheetBuilder;
};
