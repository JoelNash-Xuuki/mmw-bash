#include "modsyn.hpp"
#include <cstdio>
#include <iostream>
#include <string>
#include <stdlib.h>
#include <iostream>
#include <fstream>

int main(int argc, char **argv){

  const char* patch = argv[1];
  const char* name = argv[2];

  ModSyn modsyn= ModSyn(patch,
                        name);
  modsyn.processPatch();
  //fclose(modsyn.file);
  //fclose(modsyn.fileOut);
  //free(modsyn.oscs);

  return 0;
}
