#include "synmod.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void processPatch(const char* filename) {

  OSCMOD *oscs;
  MIXOUT *mixes;

  int osc_count = 0;
  int mix_count = 0;
  char modname[64];
  int i;

  oscs  = (OSCMOD *)malloc(MAXMODS * sizeof(OSCMOD));
  mixes = (MIXOUT *)malloc(MAXMODS * sizeof(MIXOUT));

  FILE *file = fopen(filename, "r");
  FILE *fileOut = fopen("test.csd", "w");

  if (file == NULL) {
    printf("Failed to open file: %s\n", filename);
    return;
  }

  print_header(fileOut);
  // Read in the data from patch file
  while (fscanf(file, "%s", modname) != EOF) {
    if (!strcmp(modname, "OSC")) {
      read_osc(oscs, osc_count++,file);
    } else if(! strcmp(modname, "MIXOUT")){ 
      read_mix(mixes, mix_count++,file);
    } else {
      fprintf(stderr, "%s is an unknown module\n", modname);
    }
  }

  // Print mods
  for(i =0; i < osc_count; i++){
    print_osc(oscs[i],fileOut);      
  }

  for(i =0; i < mix_count; i++){
    print_mix(mixes[i],fileOut);      
  }
  print_score(10.0,fileOut);

  fclose(file);
  fclose(fileOut);
  free(oscs);
}

int main(int argc, char **argv){
  if (argc != 2) {
      printf("Usage: %s <filename>\n", argv[0]);
      return 1;
  }

  processPatch(argv[1]);

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
void read_mix(MIXOUT *mix, int count, FILE* file){
  fscanf(file,"%s %s", mix[count].outvar, mix[count].amplitude);
}

void print_osc(OSCMOD osc, FILE* outputFile){
  float omin, omax;
  float mo2;

  fprintf(outputFile,"%s oscil ", osc.sig_out);
  if(!strcmp(osc.sig_am, "NONE")){
    fprintf(outputFile,"1.0, ");
  } else {
    fprintf(outputFile,"%s, ", osc.sig_am);
  }
  if(!strcmp( osc.sig_fm, "NONE")){
    fprintf(outputFile,"%s, ",osc.frequency);
  } else {
    fprintf(outputFile,"%s * (1.0 + %s), ",osc.frequency, osc.sig_fm);
  }
  if(!strcmp(osc.waveform, "SINE")){
    fprintf(outputFile,"isine\n");
  }
  else if(!strcmp(osc.waveform, "TRIANGLE")) {
    fprintf(outputFile,"itriangle\n");
  }
  else if(!strcmp(osc.waveform, "SAWTOOTH")){
    fprintf(outputFile,"isawtooth\n");
  }
  else if(!strcmp(osc.waveform, "SQUARE")){
    fprintf(outputFile,"isquare\n");
  }
  else if(!strcmp(osc.waveform, "PULSE")){
    fprintf(outputFile,"ipulse\n");
  }
  else {
    fprintf(stderr,"print_osc: %s is unknown - using sine instead\n",
		   osc.waveform);
    fprintf(outputFile,"isine\n");
  }
  sscanf(osc.omin,"%f",&omin); // convert strings to floats
  sscanf(osc.omax,"%f",&omax);
  if(omin != -1.0 || omax != 1.0){ // rescale output if necessary
    mo2 = (omax - omin) / 2.0;
    fprintf(outputFile,"%s = %s + (%f*%s + %f)\n",
      osc.sig_out, 
      osc.omin, 
      mo2, 
      osc.sig_out, 
      mo2
    );
  }
}
void print_mix(MIXOUT mix, FILE* outputFile){
  float amplitude;
  sscanf(mix.amplitude, "%f", &amplitude);
  fprintf(outputFile,"kenv linseg 0,.05,%f,p3-0.1,%f,.05,0\n", amplitude, amplitude);
  fprintf(outputFile,"out (%s)*kenv\n", mix.outvar);
  fprintf(outputFile,"\tendin\n\n");
}

void print_header(FILE* outputFile){
  fprintf(outputFile,"<CsoundSynthesizer>\n");
  fprintf(outputFile,"<CsOptions>\n");
  fprintf(outputFile,"-F test.mid\n");
  fprintf(outputFile,"</CsOptions>\n");
  fprintf(outputFile,"sr = 44100\n");
  fprintf(outputFile,"kr = 4410\n");
  fprintf(outputFile,"ksmps = 10\n");
  fprintf(outputFile,"nchnls = 1\n");
  fprintf(outputFile,"<CsInstruments>\n\n");
  fprintf(outputFile,"\tinstr 1\n");
  fprintf(outputFile,"isine = 1\n");
  fprintf(outputFile,"itriangle = 2\n");
  fprintf(outputFile,"isawtooth = 3\n");
  fprintf(outputFile,"isquare = 3\n");
  fprintf(outputFile,"ipulse = 3\n");
}
void print_score(float duration, FILE* outputFile){
  fprintf(outputFile,"</CsInstruments>\n");
  fprintf(outputFile,"<CsScore>\n\n");
  fprintf(outputFile,"f1 0 8192 10 1 ; sine\n");
  fprintf(outputFile,"f2 0 8192 10 1 0 .111 0 .04 0 .02 0 ; triangle\n");
  fprintf(outputFile,"f3 0 8192 10 1 .5 .333 .25 .2 .166 .142 .125 ; sawtooth\n");
  fprintf(outputFile,"f4 0 8192 10 1 0 .333 0 .2 0 .142 0 .111; square\n");
  fprintf(outputFile,"f5 0 8192 10 1 1 1 1 1 1 1 1 1 1 1 1 1; pulse\n\n");
  fprintf(outputFile,"ii 0 %f\n\n",duration);
  fprintf(outputFile,"</CsScore>\n");
  fprintf(outputFile,"</CsoundSynthesizer>\n");
}
