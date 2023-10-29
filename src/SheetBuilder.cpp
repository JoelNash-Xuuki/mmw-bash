#include "SheetBuilder.hpp"
#include <string>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

SheetBuilder::SheetBuilder(const char* sheetName,
			   const char* service,
		   	   const char* title,
                           const char* artist){
  cout << "Starting Sheet Builder..." << endl;
  this->sheet= fopen(sheetName, "w");
  this->service= service;
  this->title= title;
  this->artist= artist;
};

void SheetBuilder::printHeader(void){
  fprintf(this->sheet,"\\version \"2.22.0\"\n\n");
  fprintf(this->sheet,"\\header {\n");
  fprintf(this->sheet,"  \\tagline = \"%s\"\n", this->service);
  fprintf(this->sheet,"  \\title = \"%s\"\n", this->title);
  fprintf(this->sheet,"  \\composer = \"%s\"\n", this->artist);
}

void SheetBuilder::closeSheet(void){
   fclose(this->sheet);
}

      
