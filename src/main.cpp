#include "daw.hpp"
#include "modsyn.hpp"

int main(int argc, char **argv){
  //PrinterReader pr;
  //const char* patch= argv[1];
  //ifstream readPatchFile(patch);
  //pr.readPatch();

  ProjectFileManager* pfm = new ProjectFileManager("202210030834-3");
  AudioEngine * ae= new AudioEngine(pfm->sr,
        	  		    pfm->projectName);
  ae->getControls(argc,argv);
 
 // cout << "Program ended." << endl;  
  return 0;
}
