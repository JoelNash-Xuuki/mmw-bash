#include <stdio.h>
#include "csound.hpp"
#include "daw.hpp"
#include <iostream>
#include <string>
#include <stdlib.h>
#include <fstream>
#include <sstream>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

using namespace std;
string readFileContentsIntoString(const string& path);
FILE *createFile(string filePath, 
		 string fileName, 
		 string extension);

void getUserControls(int argc, char **argv);
void applyUserControls();
void print_header(FILE* file);
void createDir(string fileName);
string createConfigFile();
void readFile(string file);
const char* sampleRate;
bool play, rec;
string configFile;
class Config;

// current gets config options
// and will build the audioEngine

ProjectFileManager::ProjectFileManager(string projectName){
  this->projectName= projectName;
  //this->fileName= this->projectName;
  readConfigFile();
}
void ProjectFileManager::readConfigFile(){
  configFilePath << getenv("HOME") << "/mmw/tmp/" << this->projectName;
  this->configFile= getFile(configFilePath.str().c_str(), this->fileName,this->configExten);
  getConfigFileOptions(this->readfileIntoArray(this->configFile));
}
void ProjectFileManager::getConfigFileOptions(char* fileChars){
  for(int j= 0; j<strlen(fileChars); j++){
    switch(fileChars[j]){
  	  case 's': {
            if(fileChars[j+1] == 'r'){
	      cout << "Reading sample rate .." << endl;
              strncpy(sampleRate,&fileChars[2],5);
	      sscanf(sampleRate, "%d", &sr);
          }
	  case 'N': {
            if(fileChars[j+1] == 'a'){
	    cout << "Reading project name..." << endl;
            strncpy(name,&fileChars[9],100);
	    sscanf(name, "%c", &nm);
	    cout << name << endl;
	    }
          }
  	  break;
      }
    }
  }
}
int ProjectFileManager::getSampleRate(){
  return this->sr;
}
char* ProjectFileManager::readfileIntoArray(string fileName){
  ifstream file(configFile);
  if(file.is_open()){
    while(!file.eof()){
      file >> this->ch[i];
      i++;
    } 
  }
  return this->ch;
}
string ProjectFileManager::getFile(string filePath, 
			           string fileName, 
				   string extension){
  ostringstream declareFile;
  declareFile << filePath << fileName << extension;
  return declareFile.str().c_str();
}
void ProjectFileManager::createDir(){
  ostringstream declareFile;
  declareFile << getenv("HOME") << "/DAW/projects/" << fileName;
  mkdir(declareFile.str().c_str(), 0700);
}
//void FileManager::readFile(){
//  //ifstream infile(file);
//  //string line;
//  //while (getline(infile, line)){
//  //  cout << line << endl;
//  //} 
//  //cout << "Test" << endl;
//  //cout << infile.rdbuf() << endl;
//}
//class FileManager{
//  public:
	  //
//	
//
//	
//
//    
//};

AudioEngine::AudioEngine(int sampleRate, string projName){
  this->sampleRate= sampleRate;
  this->projName= projName;
}
AudioEngine::AudioEngine(int sampleRate){
  this->sampleRate= sampleRate;
}
AudioEngine::AudioEngine(int sampleRate, int argc, char **argv){
  this->sampleRate;
  getControls(argc,argv);
}
string AudioEngine::readFileContentsIntoString(const string& path) {
  ifstream input_file(path);
  if (!input_file.is_open()) {
    cerr << "Could not open the file - '"
      << path << "'" << endl;
   exit(EXIT_FAILURE);
  }
  return string((istreambuf_iterator<char>(input_file)), istreambuf_iterator<char>());
}
void AudioEngine::buildEngine(bool playBackType){
  //string contents= readFileContentsIntoString(audioEngineTemplate.str();
  //fprintf(file, readFileContentsIntoString(instrNScoTemplate).c_str(), sr.c_str());    
  //fprintf(file, contents.c_str(), sr.c_str());
  //fclose(file);
}
void AudioEngine::play(){
  csound= new Csound();
  csound->SetOption("--realtime"); 
  csound->SetOption("-odac");
 // csound->SetOption("-iadc");
  csound->SetOption("-B512");
  csound->SetOption("-b256");
  csound->SetOption("-+rtaudio=jack");
  csound->CompileOrc(
    this->readFileContentsIntoString("/home/joel/projects_/202210030854-3/src/501.orc").c_str()
  );

  csound->ReadScore(
    this->readFileContentsIntoString("/home/joel/projects_/202210030854-3/src/501.sco").c_str()
  );

  csound->Start();
  csound->Perform();	
  delete csound;
}
void AudioEngine::render() {
  csound = new Csound();
  std::string outputOp = "-o/home/joel/audio/"+ this->projName + "-a.wav";
  csound->SetOption(outputOp.c_str());
  std::string orcfilePath = getenv("HOME") + string("/projects_/") + this->projName + string("/src/") + this->projName +  ".orc";
  std::string scofilePath = getenv("HOME") + string("/projects_/") + this->projName + string("/src/") + this->projName +  ".sco";
  csound->CompileOrc(this->readFileContentsIntoString(orcfilePath.c_str()).c_str());
  csound->ReadScore(this->readFileContentsIntoString(scofilePath.c_str()).c_str());

  csound->Start();
  csound->Perform();
  delete csound;
}
void AudioEngine::runEngine(){

  csound= new Csound();
  csound->SetOption("--realtime"); 
  csound->SetOption("-odac");
 // csound->SetOption("-iadc");
  csound->SetOption("-B512");
  csound->SetOption("-b256");
  csound->SetOption("-+rtaudio=jack");
  csound->CompileOrc(
    this->readFileContentsIntoString("/home/joel/projects_/202210030854-3/src/501.orc").c_str()
  );

  csound->ReadScore(
    this->readFileContentsIntoString("/home/joel/projects_/202210030854-3/src/501.sco").c_str()
  );

  csound->Start();
  csound->Perform();	
  delete csound;
}
void AudioEngine::getControls(int argc, char **argv){

  for(int n= 0; n < argc; n++){
    //if(argc != 2 || argv[1][0] != '-'){
    //   cout << "usage: "<< argv[0] << "[ -p ] | [ -r ] | [ -s ] | [ -n ]" << endl;
    //}
    switch(argv[n][1]){
      case 'r':
 	cout << "Recording..." << endl;
        break;
      case 'p':
        cout << "Playing..." << endl;        
	this->play();
	break;
      case 'd':
        cout << "Rendering..." << endl;        
	this->render();
	break;
      case 's':
        cout << this->sampleRate << endl;
	break;
      case 'n':
        cout << "Project Name: " << this->projName<< endl;
	break;
      
      default :
	cout << "usage: "<< argv[0] << "[ -p ] | [ -r ] | [ -s ] | [ -n ]" << endl;
    }
  }
}

