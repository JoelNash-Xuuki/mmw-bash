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
                           const char* artist,
                           const char* patchName,
		           const char* sheetLocation){
  cout << "Starting Sheet Builder..." << endl;
  this->sheet= fopen(sheetName, "w");
  this->service= service;
  this->title= title;
  this->artist= artist;
  staffGroups= (STAFFGROUP *)malloc(MAXMODS * sizeof(STAFFGROUP));
  staffs= (STAFF *)malloc(MAXMODS * sizeof(STAFF));
  this->patch= fopen("patchName", "r");
  this->sheetLocation= sheetLocation;

  // Read in the data from patch file
  while (fscanf(this->patch, "%s", modname) != EOF) {
    if (!strcmp(modname, "STAFFGROUP")) {
      cout << "Reading staff group..." << endl;
      readStaffGroups(staffGroups, staffGroupCount++,this->patch);
    } else if (!strcmp(modname, "STAFF")) {
      readStaffs(staffs, staffCount++, this->patch);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }

  this->printHeader();

  for(i =0; i < staffGroupCount; i++){
    cout << "Printing staff group..." << endl;
    printStaffGroup(staffGroups[i],this->sheet);      
  }

  for(i =0; i < staffCount; i++){
    cout << "Printing staff instrument..." << endl;
    printStaff(staffs[i],this->sheet);      
  }

};

void SheetBuilder::printHeader(void){
  fprintf(this->sheet,"\\version \"2.22.0\"\n\n");
  fprintf(this->sheet,"\\header {\n");
  fprintf(this->sheet,"  \\tagline = \"%s\"\n", this->service);
  fprintf(this->sheet,"  \\title = \"%s\"\n", this->title);
  fprintf(this->sheet,"  \\composer = \"%s\"\n", this->artist);
  fprintf(this->sheet,"}\n");
  fprintf(this->sheet,"\\score {\n");
  fprintf(this->sheet,"  <<\n");
}

void SheetBuilder::readStaffGroups(STAFFGROUP *staffGroup, 
                                   int count,  
                                   FILE* patch){
  fscanf(patch,"%s",staffGroup[count].name);
  if( count >= MAXMODS ){
   fprintf(stderr,"Number of Staff Groups has exceeded maximum: %d\n", 
	  MAXMODS);
   exit(1);
  }
}

void SheetBuilder::readStaffs(STAFF *staff, 
                              int count,  
                              FILE* patch){
  cout << "Reading staff instrument..." << endl;
  fscanf(patch,"%s",staff[count].instr);
  if( count >= MAXMODS ){
   fprintf(stderr,"Number of Staffs has exceeded maximum: %d\n", 
	  MAXMODS);
   exit(1);
  }
}

void SheetBuilder::printStaffGroup(STAFFGROUP staffGroup, 
                                   FILE* sheet){
  fprintf(this->sheet,"    \\new StaffGroup << %% %s\n", 
                                       staffGroup.name);
}

void SheetBuilder::printStaff(STAFF staff, 
	                      FILE* sheet){
  cout << "inside print staff" << endl;
  char filePath[100];
  sprintf(filePath, "%s/%s.ly", this->sheetLocation, staff.instr);
  fprintf(this->sheet, "      \\include \"%s\"\n", filePath);

  FILE *instrStaff;
  instrStaff= fopen(filePath, "w");
}

//void SheetBuilder::printStaff(STAFF staff, FILE* sheet){
//  char filePath[100]; // Assuming a maximum length of 100 characters for the file path
//  sprintf(filePath, "%s/%s.ly", this->sheetLocation, staff.instr);
//  fprintf(this->sheet, "      \\include \"%s\"\n", filePath);
//  // Rest of the code...
//}


void SheetBuilder::closeSheet(void){
   fclose(this->sheet);
   fclose(this->patch);
}

      
