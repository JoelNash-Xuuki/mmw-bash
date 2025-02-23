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
		           const char* sheetLocation){
  this->log= fopen("app.log", "w");
  fprintf(this->log,"Starting Sheet Builder...\n");

  this->sheetName= sheetName;
  this->service= service;
  this->title= title;
  this->artist= artist;
  this->sheetLocation= sheetLocation;

  staffGroups= (STAFFGROUP *)malloc(MAXMODS 
                                  * sizeof(STAFFGROUP));
  staffs= (STAFF *)malloc(MAXMODS * sizeof(STAFF));
  notes= (NOTE *)malloc(MAXMODS * sizeof(NOTE));

};

SheetBuilder::SheetBuilder(const char* sheetName,
			   const char* service,
		   	   const char* title,
                           const char* artist,
                           const char* patchName,
		           const char* sheetLocation){
  this->log= fopen("app.log", "w");
  fprintf(this->log,"Starting Sheet Builder...\n");

  this->sheetName;
  
  this->title= title;
  this->artist= artist;
  this->sheetLocation= sheetLocation;

  staffGroups= (STAFFGROUP *)malloc(MAXMODS * 
                                    sizeof(STAFFGROUP));
  staffs= (STAFF *)malloc(MAXMODS * sizeof(STAFF));
  notes= (NOTE *)malloc(MAXMODS * sizeof(NOTE));
};

SheetBuilder::~SheetBuilder(){};

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
  fscanf(this->patch,"%s %s %s %s %s %s",
    staff[count].instr,
    staff[count].time,
    staff[count].tempo,
    staff[count].clef,
    staff[count].key,
    staff[count].mode); 
    staff[count].staffGroupIndex = this->staffGroupCount;
  fprintf(this->log,"Reading staff %d with group id: %d\n", 
          count, 
          staff[count].staffGroupIndex);

  if( count >= MAXMODS ){
   fprintf(stderr,"Number of Staffs has exceeded maximum: %d\n", 
	  MAXMODS);
   exit(1);
  }
}

void SheetBuilder::readNotes(NOTE *note,
                             int count){
  fscanf(this->patch,"%s",
         notes[count].pat); 
         notes[count].staffIndex= this->staffCount;

  fprintf(this->log,"Reading notes %d with staff id: %d\n", count, staffCount);

  if(noteCount>= MAXMODS ){
   fprintf(stderr,"Number of Staffs has exceeded maximum: %d\n", 
          MAXMODS);
   exit(1);
  }
}

void SheetBuilder::setPatchFile(const char* patchName){
  this->patchName= patchName;
}

void SheetBuilder::readPatchFile(){
  this->staffGroupCount= 0;
  this->patch= fopen(patchName, "r");
  fprintf(this->log,"Reading in patch file\n");
  while (fscanf(this->patch, "%s", modname) != EOF) {
    if (!strcmp(modname, "STAFFGROUP")) {
      readStaffGroups(staffGroups, ++this->staffGroupCount);
    } else if (!strcmp(modname, "STAFF")) {
      readStaffs(this->staffs, ++this->staffCount);
    } else if (!strcmp(modname, "NOTE")) {
      readNotes(this->notes, ++this->noteCount);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }
  fclose(this->patch);
}

void SheetBuilder::readPatchFile(const char* patchName){
  fprintf(this->log,"Reading in patch file...\n");
  while (fscanf(this->patch, "%s", modname) != EOF) {
    if (!strcmp(modname, "STAFFGROUP")) {
      readStaffGroups(staffGroups, ++staffGroupCount);
    } else if (!strcmp(modname, "STAFF")) {
      readStaffs(this->staffs, ++staffCount);
    } else if (!strcmp(modname, "NOTE")) {
      readNotes(this->notes, ++noteCount);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }
}

void SheetBuilder::printHeader(void){
  fprintf(this->log,"Printing Header...\n");
  char sheetHeader[100];
  strcpy(sheetHeader, this->sheetName);
  strcat(sheetHeader, "_Header.partial.ly");
  FILE* sheet= fopen(sheetHeader, "w");
  fprintf(sheet,"\\version \"2.22.0\"\n\n");
  fprintf(sheet,"\\header {\n");
  fprintf(sheet,"  tagline = \"%s\"\n", this->service);
  fprintf(sheet,"  title = \"%s\"\n", this->title);
  fprintf(sheet,"  composer = \"%s\"\n", this->artist);
  fprintf(sheet,"}\n");
  fprintf(sheet,"\\score {\n");
  fprintf(sheet,"  <<\n");
  fclose(sheet);
}

void SheetBuilder::printStaffGroupHeader() {
  int count= this->getStaffGroupCount();

  for (count; count > 0; count--){
    char sheetStaff[150];
    strcpy(sheetStaff, this->sheetName);
    string newString = "_Staff_Group_Header_" + 
                        to_string(count) + ".ly";
    strcat(sheetStaff, newString.c_str());
    fprintf(this->log, "Opening %s\n", sheetStaff);
    FILE* sheet= fopen(sheetStaff, "w");

    if (this->staffGroupCount > 0) {
      fprintf(this->log,"Printing staff group...\n");
      fprintf(sheet,"    \\new StaffGroup <<\n");
      fprintf(this->log, "Closing %s ...\n", sheetStaff);
      fclose(sheet);
      fprintf(this->log, "Closed %s\n", sheetStaff);
    }
  }
}

void SheetBuilder::printAllNotesOnStaff(){
  FILE* sheet;
  for (int i= getNoteCount(); i > 0; i--) {
    char sheetStaffNotes[100];
    strcpy(sheetStaffNotes, this->sheetName);
    string newString = "_Staff_Notes_" + std::to_string(i) + ".ly";
    strcat(sheetStaffNotes, newString.c_str());
    sheet= fopen(sheetStaffNotes, "w");
    fprintf(sheet,"        \\include \"/home/joel/projects_/notes/ns-%s\"\n",
            notes[i].pat);
    fclose(sheet);
  }
}

void SheetBuilder::printStaffInGroupHeader(){
  int count= this->getStaffCount();
  char sheetStaff[100];
 
  fprintf(this->log,"Printing all staff in group...\n");
  for (count; count > 0; count--){
    fprintf(this->log, "Printing staff: %i\n",count);
    if (count > 0) {

      strcpy(sheetStaff, this->sheetName);
      string newString = "_Staff_" + std::to_string(count) + ".ly";
      strcat(sheetStaff, newString.c_str());
      this->staffs[count].sheet = fopen(sheetStaff,"w");
      this->patch= fopen(patchName, "r");
      fprintf(this->staffs[count].sheet,"      \\new Staff \\with {\n");
      fprintf(this->staffs[count].sheet,"        instrumentName= \"%s\"\n", 
              this->staffs[count].instr);
      fprintf(this->staffs[count].sheet,"      }\n\n");
      fprintf(this->staffs[count].sheet,"      {\n");
      fprintf(this->staffs[count].sheet,"        \\time %s\n", 
              this->staffs[count].time);
      fprintf(this->staffs[count].sheet,"        \\tempo 4 = %s\n", 
              this->staffs[count].tempo);
      fprintf(this->staffs[count].sheet,"        \\clef %s\n", 
              this->staffs[count].clef);
      fprintf(this->staffs[count].sheet,"        \\key %s \\%s\n", 
              this->staffs[count].key,
              this->staffs[count].mode);
      fclose( this->staffs[count].sheet);
    }
  }
}

void SheetBuilder::printStaffInGroupCloseBracket(){
char sheetStaffs[100];
strcpy(sheetStaffs, this->sheetName);
strcat(sheetStaffs, "_Staff_Group_Close_Bracket.ly");
fprintf(this->log, "Opening %s\n", sheetStaffs);
FILE* sheet= fopen(sheetStaffs, "w");
fprintf(this->log, "Opened %s\n", sheetStaffs);
fprintf(sheet,"     >>\n");
fprintf(this->log, "Closing %s ...\n", sheetStaffs);
fclose(sheet);
fprintf(this->log, "Closed %s\n", sheetStaffs);
}

void SheetBuilder::printStaffCloseBracket(){
  fprintf(this->log,"Print Staff close Bracket...\n");
  char sheetPartial[100];
  strcpy(sheetPartial, this->sheetName);
  strcat(sheetPartial, "_Staff_Close_Bracket.ly");
  FILE* sheet= fopen(sheetPartial, "w");
  fprintf(sheet,"      }\n");
  fclose(sheet);
}

void SheetBuilder::printScoreClose(){
  fprintf(this->log,"Printing Header...\n");
  char sheetHeader[100];
  strcpy(sheetHeader, this->sheetName);
  strcat(sheetHeader, "_Close.partial.ly");
  FILE* sheet= fopen(sheetHeader, "w");
  fprintf(sheet,"  >>\n");
  fprintf(sheet,"  \\layout {}\n");
  fprintf(sheet,"  \\midi {\n");
  fprintf(sheet,"    \\tempo 4 = 84\n");
  fprintf(sheet,"  }\n");
  fprintf(sheet,"}\n");
  fclose(sheet);
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
  fprintf(this->log,"Number of notes for staff: %i\n", this->noteCount);
  return this->noteCount;
}

bool SheetBuilder::compareFiles(const char* filePath1, const char* filePath2) { std::ifstream file1(filePath1);
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

void SheetBuilder::appendFile(const string& inputFile, ofstream& outputFile) {
  std::ifstream inFile(inputFile);
  if (!inFile) {
      cerr << "Error opening input file: " << inputFile << endl;
      return;
  }
  
  outputFile << inFile.rdbuf();
  inFile.close();
}

void SheetBuilder::collectFileSections(){
  string outputPath = this->sheetName; // Change to your output file path
  outputPath += ".ly";

  if (remove(outputPath.c_str()) != 0) {
      int err = errno;
  //std::cerr << "Error deleting existing file: " << strerror(err) << std::endl;
  } else {
      //std::cout << "Existing file deleted successfully." << std::endl;
  }
  ofstream outputFile(outputPath, std::ios::app);
  if (!outputFile) {
    cerr << "Error opening output file." << std::endl;
  }
  //Confirm score conponents
  fprintf(this->log, "There are %d Staff Group(s)\n", this->staffGroupCount);
  fprintf(this->log, "There are %d Staff(s)\n", this->staffCount);
  fprintf(this->log, "There are %d Notes(s)\n", this->noteCount);

  // Add the sheet header
  char sheetHeader[100];
  strcpy(sheetHeader, this->sheetName);
  strcat(sheetHeader, "_Header.partial.ly");
  fprintf(this->log, "Append Score Header\n");
  appendFile(sheetHeader, outputFile);
  char sheetStaff[100];
  strcpy(sheetStaff, this->sheetName);

  for (int i= 0; i < this->staffGroupCount; i++) { 
    // Print the group header
    char sheetStaffGroupHeader[100];
    fprintf(this->log, "Append staff group %d\n", i + 1);
    strcpy(sheetStaffGroupHeader, this->sheetName);
    string newString = "_Staff_Group_Header_" + to_string(i + 1) + ".ly";
    strcat(sheetStaffGroupHeader, newString.c_str());
    appendFile(sheetStaffGroupHeader, outputFile);

    for (int j = 0; j <=this->staffCount; j++) {
      // Check if staff belongs to current staff group
      if (this->staffs[j].staffGroupIndex == i + 1) {
        char sheetStaff[100]; 
        fprintf(this->log, "Append staff %d to group %d \n", j, i + 1); 
        strcpy(sheetStaff, this->sheetName); 
        string newString = "_Staff_" + to_string(j) + ".ly";
        strcat(sheetStaff, newString.c_str());
        appendFile(sheetStaff, outputFile);
    
        for (int n = 0; n <=this->noteCount; n++) {
          // Check if notes belongs to current staffj
          if (this->notes[n].staffIndex == j) {
            fprintf(this->log, "Append notes %d to staff %d \n",n, j);
            char sheetStaffNotes[100];
            strcpy(sheetStaffNotes, this->sheetName);
            string newString = "_Staff_Notes_" + to_string(n) + ".ly";
            strcat(sheetStaffNotes, newString.c_str());
            appendFile(sheetStaffNotes, outputFile);
          }
        }
       // Print Close Bracket          
        char sheetStaffClose[100];
        strcpy(sheetStaffClose, this->sheetName);
        strcat(sheetStaffClose, "_Staff_Close_Bracket.ly");

        fprintf(this->log, "Append staff close bracket %d\n", j);
        appendFile(sheetStaffClose, 
                   outputFile);
      }
    }

    char sheetStaffGroupClose[100];
    strcpy(sheetStaffGroupClose, this->sheetName);
    strcat(sheetStaffGroupClose, "_Staff_Group_Close_Bracket.ly");
    fprintf(this->log, "Append Group staff close %d\n", i + 1);
    appendFile(sheetStaffGroupClose, outputFile);
  }
  char sheetClose[100];
  strcpy(sheetClose, this->sheetName);
  strcat(sheetClose, "_Close.partial.ly");
  appendFile(sheetClose, outputFile);
  outputFile.close();
}
