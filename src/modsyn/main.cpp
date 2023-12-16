#include "modsyn.hpp"
#include <cstdio>
#include <iostream>

int main(int argc, char **argv){

  const char* patch = argv[1];
  const char* name = argv[2];

  ModSyn modsyn= ModSyn(patch,
                        name);
  modsyn.processPatch();

  return 0;
}
