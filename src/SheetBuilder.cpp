#include "SheetBuilder.hpp"
#include <string>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

SheetBuilder::SheetBuilder(const char* sheetName,
			   const char* service){

  cout << "Starting Sheet Builder..." << endl;
  this->sheet= fopen(sheetName, "w");
  this->service= service;
};

void SheetBuilder::printHeader(void){
  fprintf(this->sheet,"\\version \"2.22.0\"\n\n");
  fprintf(this->sheet,"\\header {\n");
  fprintf(this->sheet,"  \\tagline = \"%s\"\n", this->service);
}

void SheetBuilder::closeSheet(void){
   fclose(this->sheet);
}

      
