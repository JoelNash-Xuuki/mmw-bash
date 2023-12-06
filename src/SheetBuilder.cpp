#include "SheetBuilder.hpp"
#include <string>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

SheetBuilder::SheetBuilder(){};

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

void SheetBuilder::readStaffs(STAFF *staff, 
                              int count){
  fprintf(this->log,"Reading staff instrument %d ...\n", count);
  fscanf(this->patch,"%s %s %s %s %s %s",
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

void SheetBuilder::readNotes(NOTE *note,
                             int count){
  fprintf(this->log,"Reading notes to go on staff %d ...\n", count);
  fscanf(this->patch,"%s",
         notes[count].pat); 
  if( count >= MAXMODS ){
   fprintf(stderr,"Number of Staffs has exceeded maximum: %d\n", 
	  MAXMODS);
   exit(1);
  }
}

void SheetBuilder::readPatchFile(){
  fprintf(this->log,"Reading in patch file...\n");
  while (fscanf(this->patch, "%s", modname) != EOF) {
    if (!strcmp(modname, "STAFFGROUP")) {
      readStaffGroups(staffGroups, ++staffGroupCount);
    } else if (!strcmp(modname, "STAFF")) {
      readStaffs(staffs, ++staffCount);
    } else if (!strcmp(modname, "NOTE")) {
      readNotes(this->notes, ++this->noteCount);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }
}

void SheetBuilder::printStaffGroupHeader() {
  char sheetStaffs[100];
  strcpy(sheetStaffs, this->sheetName);
  strcat(sheetStaffs, "_Staff_Group_Header.ly");

  fprintf(this->log, "Opening %s ...\n", sheetStaffs);
  FILE* sheet= fopen(sheetStaffs, "w");
  fprintf(this->log, "Opened %s\n", sheetStaffs);
  if (this->staffGroupCount > 0) {
    fprintf(this->log,"Printing staff group...\n");
    fprintf(sheet,"    \\new StaffGroup <<\n");
  }

  fprintf(this->log, "Closing %s ...\n", sheetStaffs);
  fclose(sheet);
  fprintf(this->log, "Closed %s\n", sheetStaffs);
}

void SheetBuilder::printAllNotesOnStaff(FILE *sheet) {
  //fprintf(this->log,"Printing all Notes on staff %i\n", this->noteCount);
  //int noteNo;
  //int i= getNoteCount();
  //for (int i= getNoteCount(); i > 0; i--) {
  //  fprintf(sheet,"        \\include \"/home/joel/projects_/Hello/src/score/notes/ns-%s\"\n",notes[i].pat);
  //}
}

void SheetBuilder::printStaffInGroup(STAFF *staff,
		                     int count) {
  fprintf(this->log,"Printing all staff in group...\n");
  fprintf(this->log, "Printing staff: %i\n",count);
  if (count > 0) {
    fprintf(staff[count].sheet,"      \\new Staff \\with {\n");
    fprintf(staff[count].sheet,"        instrumentName= \"%s\"\n", 
            staff[count].instr);
    fprintf(staff[count].sheet,"      }\n\n");
    fprintf(staff[count].sheet,"      {\n");
    fprintf(staff[count].sheet,"        \\time %s\n", 
           staff[count].time);
    fprintf(staff[count].sheet,"        \\tempo %s\n", 
            staff[count].tempo);
    fprintf(staff[count].sheet,"        \\clef %s\n", 
            staff[count].clef);
    fprintf(staff[count].sheet,"        \\key %s \\%s\n", 
	    staff[count].key,
            staff[count].mode);
    //printAllNotesOnStaff(staff[count].sheet);
    fprintf(staff[count].sheet,"      }\n");
    fprintf(this->log,"Closing staff sheet\n");
    fclose(staff[count].sheet);
  }
}



int SheetBuilder::getStaffGroupCount(){
  fprintf(this->log,"Number of staff groups: %i\n", this->staffGroupCount);
  return this->staffGroupCount;
}

void SheetBuilder::setStaffGroupCount(int count){
  this->staffGroupCount= count;
}

int SheetBuilder::getStaffCount(){
  fprintf(this->log,"Number of staff groups: %i\n", this->staffCount);
  return this->staffCount;
}

void SheetBuilder::setStaffCount(int count){
  this->staffCount= count;
}

int SheetBuilder::getNoteCount(){
  fprintf(this->log,"Number of notes for staff: %i\n", this->staffGroupCount);
  return this->noteCount;
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
