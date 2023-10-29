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

#ifndef SheetBuilder_H
#define SheetBuilder_H
class SheetBuilder{
  private:
    FILE *sheet;
    const char* service ;
  public:
    SheetBuilder(const char* sheetName,
                 const char* service
    );
    void printHeader(void);
    void closeSheet(void);
};
# endif





//void processFile(const char* filename)

//typedef struct { // INSTR;
//  char no[SYNMOD_CHARS];
//} INSTR;

//typedef struct { // MIXOUT;
//  char outvar[SYNMOD_CHARS];
//  char amplitude[SYNMOD_CHARS];
//} MIXOUT;
//
//typedef struct { // NOISEMOD
//  char speed[SYNMOD_CHARS];
//  char sig_out[SYNMOD_CHARS];
//  char seed[SYNMOD_CHARS];
//  char omin[SYNMOD_CHARS];
//  char omax[SYNMOD_CHARS];
//} NOISEMOD;
//
//typedef struct { //  VCFMOD
//  char sig_in[SYNMOD_CHARS];
//  char sig_out[SYNMOD_CHARS];
//  char cutoff[SYNMOD_CHARS];
//  char resonance[SYNMOD_CHARS];
//} VCFMOD;
//
//typedef struct { // ENVMOD;
//  char amp[SYNMOD_CHARS];
//  char sig_out[SYNMOD_CHARS];
//} ENVMOD;
//
//class PrinterReader{
//  private:
//    MIXOUT *mixes;
//    OSC *oscs;
//    NOISEMOD *noises;
//    NOISEMOD *sahs;
//    VCFMOD *vcfs;
//    ENVMOD *envs;
//
//    int osc_count= 0;
//    char modname[64];
//    int mix_count= 0;
//    int noise_count= 0;
//    int sah_count= 0;
//    int vcf_count= 0;
//    int env_count= 0;
//    int i;
//
//    void initialize_globals(OSC      *oscs,   int osc_count, 
//  			    NOISEMOD *noises, int noise_count, 
//  			    NOISEMOD *sahs,   int sah_count,
//  			    VCFMOD   *vcfs,   int vcf_count);
//  public: 
//    PrinterReader();
//    void readPatch();
//};
						
      

//    void print_header(void){
//      printf("<CsoundSynthesizer>\n");
//      printf("<CsOptions>\n");
//      printf("-F test.mid\n");
//      printf("</CsOptions>\n");
//      printf("sr = 44100\n");
//      printf("kr = 4410\n");
//      printf("ksmps = 10\n");
//      printf("nchnls = 1\n");
//      printf("<CsInstruments>\n\n");
//    }
//
//    void print_score(){
//      printf("</CsInstruments>\n");
//      printf("<CsScore>\n\n");
//      printf("f1 0 8192 10 1 ; sine\n");
//      printf("f2 0 8192 10 1 0 .111 0 .04 0 .02 0 ; triangle\n");
//      printf("f3 0 8192 10 1 .5 .333 .25 .2 .166 .142 .125 ; sawtooth\n");
//      printf("f4 0 8192 10 1 0 .333 0 .2 0 .142 0 .111; square\n");
//      printf("f5 0 8192 10 1 1 1 1 1 1 1 1 1 1 1 1 1; pulse\n\n");
//      printf("f0 40\n");
//      printf("</CsScore>\n");
//      printf("</CsoundSynthesizer>\n");
//    }

//void read_instr(INSTR *instr, int count);
//void print_instr(INSTR instr);
//
//void read_osc(OSC *oscs, int count);
//void print_osc(OSC osc);
//
//void read_mix(MIXOUT *mix, int count);
//void print_mix(MIXOUT mix);
//
//void read_noise(NOISEMOD *unit, int count);
//void print_noise(NOISEMOD noise);
//void print_sah(NOISEMOD noise);
//
//void read_vcf(VCFMOD *unit, int count);
//void print_vcf(VCFMOD vcf);
//
//void read_env(ENVMOD *oscs, int count);
//void print_env(ENVMOD osc);
//
//void print_header(void);
//void print_score();



