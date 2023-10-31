#include <cstdio>
#include <cstdlib>
#include <string>
#include <cstring>
#define SYNMOD_CHARS (128)
#define MAXMODS (256)

using namespace std;

#ifndef TestSheetBuilder_H
#define TestSheetBuilder_H

class TestSheetBuilder {
public:
    TestSheetBuilder(const char* sheetName, 
                     const char* service, 
                     const char* title,
                     const char* artist, 
                     const char* patchName, 
                     const char* sheetLocation);
    void closeSheet(void);
};
# endif
