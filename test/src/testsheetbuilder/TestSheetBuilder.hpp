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
#include "../../../src/SheetBuilder.hpp"

using namespace CppUnit;
using namespace std;

class TestSheetBuilder : public CppUnit::TestFixture
{
  CPPUNIT_TEST_SUITE(TestSheetBuilder);
  CPPUNIT_TEST(canPrintScoreHeader);
  CPPUNIT_TEST(canReadPatchFileStaffGroupsStaffCountAndNoteCount);
  CPPUNIT_TEST(canReadPatchFileOfMultipleStaffGroupsStaffCountAndNoteCount);
  CPPUNIT_TEST(canPrintStaffGroupHeader);
  CPPUNIT_TEST(canPrintMultipleStaffGroupHeaders);
  CPPUNIT_TEST(canPrintStaffInGroupHeader);
  CPPUNIT_TEST(canPrintMultipleStaffInGroupHeader);
  CPPUNIT_TEST(canPrintNotesOnStaff);
  //CPPUNIT_TEST(canPrintStaffInGroupCloseBracket);
  //CPPUNIT_TEST(canAppendScoreFileSections);
  //CPPUNIT_TEST(canPrintScoreClose);
  CPPUNIT_TEST_SUITE_END();

public:
  void setUp(void);
  void tearDown(void);

protected:
  void canPrintScoreHeader(void);
  void canReadPatchFileStaffGroupsStaffCountAndNoteCount(void);
  void canReadPatchFileOfMultipleStaffGroupsStaffCountAndNoteCount(void);
  void canPrintStaffGroupHeader(void);
  void canPrintMultipleStaffGroupHeaders(void);
  void canPrintStaffInGroupHeader(void);
  void canPrintMultipleStaffInGroupHeader(void);
  void canPrintNotesOnStaff(void);
  void canPrintStaffInGroupCloseBracket(void);
  void canPrintScoreClose(void);
  void canAppendScoreFileSections(void);

private:
  SheetBuilder sheetBuilder;
  void defineStaffStructure(void);
  FILE* testSheet;
  FILE* expectedSheet;
  STAFF *staff;
};
