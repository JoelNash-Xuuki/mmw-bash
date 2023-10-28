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
  int i;

  while (fscanf(file, "%s", modname) != EOF) {
    if (!strcmp(modname, "OSC")) {
      // Read in the data
      read_osc(oscs, osc_count,file);
      // Print it to make sure it's ok
      ++osc_count;
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }
  // Print it to make sure it's ok
  for(i =0; i < osc_count; i++){
    print_osc(oscs[i]);      
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

void print_osc(OSCMOD osc){
  float omin, omax;
  float mo2;

  printf("%s oscil ", osc.sig_out);
  if(!strcmp(osc.sig_am, "NONE")){
    printf("1.0, ");
  } else {
    printf("%s, ", osc.sig_am);
  }
  if(!strcmp( osc.sig_fm, "NONE")){
    printf("ifrq, ");
  } else {
    printf("%s * (1.0 + %s), ",osc.frequency, osc.sig_fm);
  }
  if(!strcmp(osc.waveform, "SINE")){
    printf("isine\n");
  }
  else if(!strcmp(osc.waveform, "TRIANGLE")) {
    printf("itriangle\n");
  }
  else if(!strcmp(osc.waveform, "SAWTOOTH")){
    printf("isawtooth\n");
  }
  else if(!strcmp(osc.waveform, "SQUARE")){
    printf("isquare\n");
  }
  else if(!strcmp(osc.waveform, "PULSE")){
    printf("ipulse\n");
  }
  else {
    fprintf(stderr,"print_osc: %s is unknown - using sine instead\n",
		   osc.waveform);
    printf("isine\n");
  }
  sscanf(osc.omin,"%f",&omin); // convert strings to floats
  sscanf(osc.omax,"%f",&omax);
  if(omin != -1.0 || omax != 1.0){ // rescale output if necessary
    mo2 = (omax - omin) / 2.0;
    printf("%s = %s + (%f*%s + %f)\n",
	   osc.sig_out, osc.omin, mo2, osc.sig_out, mo2);
  }
}
