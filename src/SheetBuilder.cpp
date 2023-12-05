#include "SheetBuilder.hpp"
#include <string>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

SheetBuilder::SheetBuilder(){};

int
SheetBuilder::getStaffCount(){
  fprintf(this->log,"Number of staff groups: %i\n", this->staffCount);
  return this->staffCount;
}

int
SheetBuilder::getStaffGroupCount(){
  fprintf(this->log,"Number of staff groups: %i\n", this->staffGroupCount);
  return this->staffGroupCount;
}

SheetBuilder::SheetBuilder(const char* sheetName,
			   const char* service,
		   	   const char* title,
                           const char* artist,
                           const char* patchName,
		           const char* sheetLocation){
  this->log= fopen("app.log", "w");
  fprintf(this->log,"Starting Sheet Builder...\n");

  this->sheetName= sheetName;
  this->service= service;
  this->title= title;
  this->artist= artist;
  this->sheetLocation= sheetLocation;

  staffGroups= (STAFFGROUP *)malloc(MAXMODS * sizeof(STAFFGROUP));
  staffs= (STAFF *)malloc(MAXMODS * sizeof(STAFF));
  this->patch= fopen(patchName, "r");

};

SheetBuilder::~SheetBuilder(){};



void SheetBuilder::printHeader(void){
  fprintf(this->log,"Printing Header...\n");
  char sheetHeader[100];
  strcpy(sheetHeader, this->sheetName);
  strcat(sheetHeader, "_Header.partial.ly");
  FILE* sheet= fopen(sheetHeader, "w");
  fprintf(sheet,"\\version \"2.22.0\"\n\n");
  fprintf(sheet,"\\header {\n");
  fprintf(sheet,"  \\tagline = \"%s\"\n", this->service);
  fprintf(sheet,"  \\title = \"%s\"\n", this->title);
  fprintf(sheet,"  \\composer = \"%s\"\n", this->artist);
  fprintf(sheet,"}\n");
  fprintf(sheet,"\\score {\n");
  fprintf(sheet,"  <<\n");
  fclose(sheet);
}

void SheetBuilder::readStaffGroups(STAFFGROUP *staffGroup, 
                                   int count){
  fprintf(this->log,"Reading staff group: %i...\n", count);
  fscanf(this->patch,"%s",staffGroup[count].name);
  if( count >= MAXMODS ){
   fprintf(stderr,"Number of Staff Groups has exceeded maximum: %d\n", 
      MAXMODS);
   exit(1);
  }
}

void SheetBuilder::readPatchFile(){
  fprintf(this->log,"Reading in patch file...\n");
  while (fscanf(this->patch, "%s", modname) != EOF) {
    if (!strcmp(modname, "STAFFGROUP")) {
      readStaffGroups(staffGroups, ++staffGroupCount);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }
}

bool SheetBuilder::compareFiles(const char* filePath1, const char* filePath2) {
    std::ifstream file1(filePath1);
    std::ifstream file2(filePath2);

    if (!file1.is_open() || !file2.is_open()) {
        return false; // Unable to open one or both files
    }

    char ch1, ch2;

    while (true) {
        ch1 = file1.get();
        ch2 = file2.get();

        if (ch1 != ch2) {
            file1.close();
            file2.close();
            return false; // Files differ
        }

        if (file1.eof() && file2.eof()) {
            break; // Reached the end of both files, and they are identical
        }

        if (file1.eof() || file2.eof()) {
            file1.close();
            file2.close();
            return false; // Files have different sizes
        }
    }

    file1.close();
    file2.close();
    return true; // Files are identical
}     
