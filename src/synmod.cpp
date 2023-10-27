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
      fscanf(file, "%s", oscs[osc_count].sig_out);
      fscanf(file, "%s", oscs[osc_count].frequency);
      fscanf(file, "%s", oscs[osc_count].waveform);
      fscanf(file, "%s", oscs[osc_count].sig_am);
      fscanf(file, "%s", oscs[osc_count].sig_fm);
      fscanf(file, "%s", oscs[osc_count].omin);
      fscanf(file, "%s", oscs[osc_count].omax);
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
    }
  }

  fclose(file);
  free(oscs);
}
