#include <string>
#include <stdio.h>
#include "csound.hpp"
#include <iostream>
#include <string>
#include <stdlib.h>
#include <fstream>
#include <sstream>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

using namespace std;
#ifndef SD_H
#define SD_H
class ProjectFileManager{
  private:
    string fileName;
	ostringstream configFilePath;
	string configExten= ".conf";
	ostringstream audioEngineTemplateFilePath;
	string configFile;
    	char sampleRate[9];
	char name[50];
	char nm[50];
    	char ch[1000];
	int i= 0;

  public:
    int sr;
    string projectName;
    ProjectFileManager(string projectName);
    string getFile(string filePath, 
		   string fileName, 
		   string extension);
	void createDir();
	char* readfileIntoArray(string fileName);
	void readForConfigFileOptions();
	int getSampleRate();
	void getConfigFileOptions(char* fileChars);
	void readConfigFile();
};

class AudioEngine{
  private:
  	Csound* csound;
	int sampleRate;
	string projName;
  public:
	AudioEngine(int sampleRate);
	AudioEngine(int sampleRate, string projName);
	AudioEngine(int sampleRate, int argc, char **argv);
	void getControls(int argc, char **argv);
	void runEngine();
	void play();
	void render();
	void buildEngine(bool playBackType);
	string readFileContentsIntoString(const string& path);
};

class DAW{
  public:
	bool wasRun; 
  public:
	DAW(string name);
	void testMethod();
};
# endif

