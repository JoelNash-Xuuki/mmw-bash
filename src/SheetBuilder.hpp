#include <cstdio>
#include <cstdlib>
#include <string>
#include <cstring>
#define SYNMOD_CHARS (128)
#define MAXMODS (256)

using namespace std;



typedef struct { // STAFFGROUP
  char name[SYNMOD_CHARS];
} STAFFGROUP;

typedef struct { // STAFF
  char instr[SYNMOD_CHARS];
  char time[SYNMOD_CHARS];
  char tempo[SYNMOD_CHARS];
  char clef[SYNMOD_CHARS];
  char key[SYNMOD_CHARS];
  char mode[SYNMOD_CHARS];
  FILE* sheet;
  int staffGroupIndex;
} STAFF;

typedef struct { // NOTES
  char pat[SYNMOD_CHARS];
  int staffIndex;
} NOTE;

#ifndef SheetBuilder_H
#define SheetBuilder_H
class SheetBuilder{
  private:
    FILE *patch;
    STAFFGROUP *staffGroups;
    STAFF *staffs;
    NOTE *notes;
    int staffGroupCount= 0;
    int staffCount= 0;
    int noteCount= 0;
    const char* service;
    const char* title;
    const char* artist;
    const char* patchName;
    char modname[64];
    int i;
    const char* sheetLocation;

  protected:
    const char* sheetName;
    FILE *log;

  public:
    FILE *sheet;
    SheetBuilder();
    SheetBuilder(const char* sheetName,
                 const char* service,
                 const char* title,
                 const char* artist,
                 const char* patchName,
		 const char* sheetLocation);

    SheetBuilder(const char* sheetName,
                 const char* service,
                 const char* title,
                 const char* artist,
		 const char* sheetLocation);
    ~SheetBuilder();
    void printHeader(void);
    void readStaffs(STAFF *staff, 
                    int count);
    void readNotes(NOTE *note,
                   int count);
    void readStaffGroups(STAFFGROUP *staffGroup, 
                         int count);
    void setPatchFile(const char* patchName);
    void readPatchFile();
    void readPatchFile(const char* patchName);
    void printStaffGroupHeader(void);
    void printStaffInGroupHeader();
    void printAllNotesOnStaff();
    void printStaffInGroupCloseBracket();
    void printStaffCloseBracket();
    void printScoreClose();
    void appendFile(const string& inputFile, ofstream& outputFile);
    void collectFileSections();

    int getStaffGroupCount();
    void setStaffGroupCount(int count);

    int getStaffCount();
    void setStaffCount(int count);

    int getNoteCount();
    bool compareFiles(const char* filePath1, const char* filePath2);
};
# endif
