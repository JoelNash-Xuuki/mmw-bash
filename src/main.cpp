//#include "daw.hpp"
//#include "modsyn.hpp"

#include "synmod.hpp"

int main(int argc, char **argv){

  if (argc != 2) {
      printf("Usage: %s <filename>\n", argv[0]);
      return 1;
    }

  processFile(argv[1]);
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


