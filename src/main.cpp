//#include "daw.hpp"
//#include "modsyn.hpp"
#include "SheetBuilder.hpp"

//#include "synmod.hpp"
#include <cstdio>
#include <iostream>

int main(int argc, char **argv){

//  ModSyn ms= ModSyn("testMethod"); 
 // ms.processFile(argv[1]);

  if (argc != 3) {
      printf("Usage: %s <filename> <projectname>\n", argv[0]);
      return 1;
  }

  const char* filename = argv[1];
  const char* projectname = argv[2];

  SheetBuilder sheetBuilder= SheetBuilder(argv[1],argv[2]);
  sheetBuilder.printHeader();
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


