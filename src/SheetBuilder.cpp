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

  this->sheet= fopen(sheetName, "w");

  this->service= service;
  this->title= title;
  this->artist= artist;

  staffGroups= (STAFFGROUP *)malloc(MAXMODS * sizeof(STAFFGROUP));
  staffs= (STAFF *)malloc(MAXMODS * sizeof(STAFF));

  this->patch= fopen(patchName, "r");
  this->sheetLocation= sheetLocation;

};

SheetBuilder::~SheetBuilder(){};

void SheetBuilder::readPatchFile(){

}

void SheetBuilder::printHeader(void){

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
