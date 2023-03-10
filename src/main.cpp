#include "daw.hpp"

int main(int argc, char **argv){
  cout << "Program Started." << endl;
  ProjectFileManager* pfm = new ProjectFileManager("202210030835");
  AudioEngine * ae= new AudioEngine(pfm->sr,
		  		    pfm->projectName);
  ae->getControls(argc,argv);
  cout << "Program ended." << endl;  
  return 0;
}
