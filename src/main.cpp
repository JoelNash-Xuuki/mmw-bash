#include "SheetBuilder.hpp"
#include <cstdio>
#include <iostream>

int main(int argc, char **argv){

  if (argc != 7) {
      printf("Usage: %s <filename> <service> <title> <artist>\n", argv[0]);
      return 1;
  }

  const char* sheetName = argv[1];
  const char* service = argv[2];
  const char* title = argv[3];
  const char* artist = argv[4];
  const char* patchName= argv[5];
  const char* sheetLocation= argv[6];

  SheetBuilder sheetBuilder= SheetBuilder(sheetName,
                                          service,
                                          title,
                                          artist,
					  patchName,
					  sheetLocation);
  sheetBuilder.printHeader();
  sheetBuilder.printStaffGroupHeader();
  return 0;
}
