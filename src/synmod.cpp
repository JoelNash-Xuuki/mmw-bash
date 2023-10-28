#include "synmod.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void processFile(const char* filename) {
  FILE *file = fopen(filename, "r");
  if (file == NULL) {
    printf("Failed to open file: %s\n", filename);
    return;
  }

  OSCMOD *oscs = (OSCMOD *)malloc(MAXMODS * sizeof(OSCMOD));
  int osc_count = 0;
  char modname[64];

  while (fscanf(file, "%s", modname) != EOF) {
    if (!strcmp(modname, "OSC")) {
      // Read in the data
      read_osc(oscs, osc_count,file);
      // Print it to make sure it's ok
      printf("%s %s %s %s %s %s %s\n",
        oscs[osc_count].sig_out,
        oscs[osc_count].frequency,
        oscs[osc_count].waveform,
        oscs[osc_count].sig_am,
        oscs[osc_count].sig_fm,
        oscs[osc_count].omin,
        oscs[osc_count].omax);
        ++osc_count;
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }

    
    // Print it to make sure it's ok
    for(int i =0; i < osc_count; i++){
      
    }
      
  }

  fclose(file);
  free(oscs);
}

int main(int argc, char **argv){
  if (argc != 2) {
      printf("Usage: %s <filename>\n", argv[0]);
      return 1;
  }

  processFile(argv[1]);

  return 0;
}

void read_osc(OSCMOD *oscs, int count, FILE* file){
 fscanf(file,"%s %s %s %s %s %s %s",
 oscs[count].sig_out,
 oscs[count].frequency,
 oscs[count].waveform, 
 oscs[count].sig_am, 
 oscs[count].sig_fm, 
 oscs[count].omin, 
 oscs[count].omax);
 if( count >= MAXMODS ){
   fprintf(stderr,"Number of oscillators has exceeded maximum: %d\n", MAXMODS);
   exit(1);
  }
}
