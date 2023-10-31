#include <cppunit/TestCase.h>
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/ui/text/TestRunner.h>
#include <cppunit/TextOutputter.h>
#include <iostream>
#include "TestSheetBuilder.hpp"

class MyTestFixture : public CppUnit::TestFixture {
  // Declare any member variables or helper functions needed for setup and teardown
public:
  // Implement the setup and teardown methods
  void setUp() {
    // Perform any necessary setup actions before each test case
  }

  void tearDown() {
    // Perform any necessary cleanup actions after each test case
  }
};

class MyTest : public MyTestFixture {
  CPPUNIT_TEST_SUITE(MyTest);
  CPPUNIT_TEST(testAddition);
  CPPUNIT_TEST_SUITE_END();

public:
  void testAddition() {
    int result = 2 + 2;
    CPPUNIT_ASSERT_EQUAL(4, result);
  }
};

CPPUNIT_TEST_SUITE_REGISTRATION(MyTest);

