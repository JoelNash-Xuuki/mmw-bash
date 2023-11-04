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

  this->patch= fopen("patchName", "r");
  this->sheetLocation= sheetLocation;

  this->readPatchFile();
  

  //this->printHeader();

  //for(i =0; i < staffGroupCount; i++){
  //  fprintf(this->log,"Printing staff group...\n");
  //  printStaffGroup(staffGroups[i],this->sheet);      
  //}

  //for(i =0; i < staffCount; i++){
  //  fprintf(this->log,"Printing staff instrument...\n");
  //  printStaff(staffs[i]);      
  //}

};

SheetBuilder::~SheetBuilder(){};

void SheetBuilder::readPatchFile(){
// Read in the data from patch file
  while (fscanf(this->patch, "%s", modname) != EOF) {
    if (!strcmp(modname, "STAFFGROUP")) {
      fprintf(this->log,"Reading staff group...\n");
      readStaffGroups(staffGroups, staffGroupCount++,this->patch);
    } else if (!strcmp(modname, "STAFF")) {
      readStaffs(staffs, staffCount++, this->patch);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }
}

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
  fprintf(this->log,"Reading staff instrument...\n");
  fscanf(patch,"%s %s %s %s %s %s",
         staff[count].instr,
         staff[count].time,
         staff[count].tempo,
         staff[count].clef,
         staff[count].key,
         staff[count].mode); 

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

void SheetBuilder::printStaff(STAFF staff){
  fprintf(this->log,"inside print staff path...\n");
  char staffFilePath[100];
  char notesFilePath[100];
  sprintf(staffFilePath, "%s/%s.ly", this->sheetLocation, staff.instr);
  //sprintf(notesFilePath, "\"%s/notes/ns-xxxx\"\n", this->sheetLocation);

  sheet= fopen(staffFilePath, "w");
  fprintf(sheet,"\\new Staff \\with {\n");
  //fprintf(sheet,"  instrumentName= \"%s\"\n", staff.instr);
  //fprintf(sheet, "nn");
  //fprintf(sheet,"{\n\n");
  //fprintf(sheet,"  \\time %s\n", staff.time);
  //fprintf(sheet,"  \\tempo %s\n", staff.tempo);
  //fprintf(sheet,"  \\clef= %s\n", staff.clef);
  //fprintf(sheet,"  \\key %s \\%s\n", staff.key, staff.mode);
  //fprintf(sheet,"      \\include %s", notesFilePath);
  //fprintf(sheet,"}\n");
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

      
