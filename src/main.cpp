#include "daw.hpp"
#include "modsyn.hpp"

int main(int argc, char **argv){
  //PrinterReader pr;
  //const char* patch= argv[1];
  const char* projName= argv[2];
  //ifstream readPatchFile(patch);
  //pr.readPatch();

  ProjectFileManager* pfm = new ProjectFileManager(projName);
  AudioEngine * ae= new AudioEngine(44100,
        	  		    projName);
  ae->getControls(argc,argv);
 
 // cout << "Program ended." << endl;  
  return 0;
}
