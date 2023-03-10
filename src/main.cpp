#include "daw.hpp"

int main(int argc, char **argv){
  cout << "Program Started." << endl;
  //applyUserControls();
  //string projectName= argv[1];
  ProjectFileManager* pfm = new ProjectFileManager("202210030835");
  AudioEngine * ae= new AudioEngine(48000,pfm->projectName);
  ae->getControls(argc,argv);
  cout << "Program ended." << endl;  
  return 0;
}
