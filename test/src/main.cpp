#include "TestSheetBuilder.hpp"
#include <cstdio>
#include <iostream>
#include <cppunit/TestCase.h>
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/ui/text/TestRunner.h>
#include <cppunit/TextOutputter.h>
#include <iostream>

int main() {
  CppUnit::TextUi::TestRunner runner;
  runner.addTest(CppUnit::TestFactoryRegistry::getRegistry().makeTest());
  runner.setOutputter(new CppUnit::TextOutputter(&runner.result(), std::cout));
  bool success = runner.run();
  return success ? 0 : 1;
}
