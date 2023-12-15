#include "modsyn.hpp"
#include <cstdio>
#include <iostream>

int main(int argc, char **argv){

  const char* patch = argv[1];

  ModSyn modsyn= ModSyn(patch);
  modsyn.processPatch();

  return 0;
}
