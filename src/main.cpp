//#include "daw.hpp"
//#include "modsyn.hpp"
#include "SheetBuilder.hpp"

//#include "synmod.hpp"
#include <cstdio>
#include <iostream>

int main(int argc, char **argv){

//  ModSyn ms= ModSyn("testMethod"); 
 // ms.processFile(argv[1]);

  if (argc != 6) {
      printf("Usage: %s <filename> <service> <title> <artist>\n", argv[0]);
      return 1;
  }

  const char* sheetName = argv[1];
  const char* service = argv[2];
  const char* title = argv[3];
  const char* artist = argv[4];
  const char* patchName= argv[5];

  SheetBuilder sheetBuilder= SheetBuilder(sheetName,
                                          service,
                                          title,
                                          artist,
					  patchName);
  sheetBuilder.closeSheet();

  //processFile(argv[1]);
  //PrinterReader pr;
  //const char* patch= argv[1];
  //const char* projName= argv[2];
  //ifstream readPatchFile(patch);
  //pr.readPatch();
  //take me to main

  //ProjectFileManager* pfm = new ProjectFileManager(projName);
  //AudioEngine * ae= new AudioEngine(44100,
  //      	  		    projName);
  //ae->getControls(argc,argv);
 
 // cout << "Program ended." << endl;  

  return 0;
}


