#include "modsyn.hpp"
#include <string>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

PrinterReader::PrinterReader(){

      mixes=  (MIXOUT *)   malloc(MAXMODS * sizeof(MIXOUT));
      oscs=   (OSC *)   malloc(MAXMODS * sizeof(OSC));
      noises= (NOISEMOD *) malloc(MAXMODS * sizeof(NOISEMOD));
      sahs=   (NOISEMOD *) malloc(MAXMODS * sizeof(NOISEMOD));
      vcfs=   (VCFMOD *)   malloc(MAXMODS * sizeof(VCFMOD));
      envs=   (ENVMOD *)   malloc(MAXMODS * sizeof(ENVMOD));
}

void PrinterReader:: readPatch(){
//  string* mod;
//  while(fscanf("%s", modname ) != EOF){
      //     if(! strcmp(modname, "OSC")){
	  //       printf("TEST");
      //       //read_osc(oscs, osc_count++);
      //     }
      //     //else if(! strcmp(modname, "MIXOUT")){
      //     //  read_mix(mixes, mix_count++);
      //     //}
      //     //else if(! strcmp(modname, "NOISE")){
      //     //  read_noise(noises, noise_count++);
      //     //}
      //     //else if(! strcmp(modname, "SAH")){
      //     //  read_noise(sahs, sah_count++);
      //     //}
      //     //else if(! strcmp(modname, "VCF")){
      //     //  read_vcf(vcfs, vcf_count++);
      //     //}
      //     //
      //     //else if(! strcmp(modname, "ENV")){
      //     //  read_env(envs, env_count++);
      //     //} else {
      //     //  fprintf(stderr,"%s is an unknown module\n", modname);
      //     //}
  //}
}




void PrinterReader::initialize_globals(OSC *oscs, int osc_count, 
  			               NOISEMOD *noises, int noise_count, 
  			               NOISEMOD *sahs, int sah_count,
	                               VCFMOD *vcfs, int vcf_count){

  int i;
  for(i = 0; i < osc_count; i++){
    printf("%s init 0.0\n", oscs[i].sig_out);
      //}
      //for(i = 0; i < noise_count; i++){
      //  printf("%s init 0.0\n", noises[i].sig_out);
      //}
      //for(i = 0; i < sah_count; i++){
      //  printf("%s init 0.0\n", sahs[i].sig_out);
      //}
      //for( i = 0; i < vcf_count; i++){
      //  printf("%s init 0.0\n", vcfs[i].sig_out);
      //}
   }
}
  //print_header();

  //pr.initialize_globals(oscs, osc_count, 
  //  			     noises, noise_count, 
  //  				 sahs, sah_count, 
  //  				 vcfs, vcf_count);

  //for(i = 0; i < osc_count; i++){
  //  print_osc(oscs[i]);
  //}
  //for(i = 0; i < noise_count; i++){
  //  print_noise(noises[i]);
  //}
  //for(i = 0; i < sah_count; i++){
  //  print_sah(sahs[i]);
  //}
  //for(i = 0; i < vcf_count; i++){
  //  print_vcf(vcfs[i]);
  //}
  //for(i = 0; i < env_count; i++){
  //  print_env(envs[i]);
  //}
  //for(i = 0; i < mix_count; i++){
  //  print_mix(mixes[i]);
  //}

  //print_score();

//void read_osc(OSCMOD *oscs, int count){
//  scanf("%s %s %s %s %s %s",oscs[count].sig_out,
//							   oscs[count].waveform, 
//							   oscs[count].sig_am, 
//							   oscs[count].sig_fm, 
//							   oscs[count].omin, 
//							   oscs[count].omax);
//  if( count >= MAXMODS ){
//    fprintf(stderr,"Number of oscillators has exceeded maximum: %d\n",
//	    MAXMODS);
//    exit(1);
//  }
//}
//
//void print_osc(OSCMOD osc){
//  float omin, omax;
//  float mo2;
//
//  printf("%s oscil ", osc.sig_out);
//  if(!strcmp(osc.sig_am, "NONE")){
//    printf("1.0, ");
//  } else {
//    printf("%s, ", osc.sig_am);
//  }
//  if(!strcmp( osc.sig_fm, "NONE")){
//    printf("ifrq, ");
//  } else {
//    printf("%s * (1.0 + %s), ",osc.frequency, osc.sig_fm);
//  }
//  if(!strcmp(osc.waveform, "SINE")){
//    printf("isine\n");
//  }
//  else if(!strcmp(osc.waveform, "TRIANGLE")) {
//    printf("itriangle\n");
//  }
//  else if(!strcmp(osc.waveform, "SAWTOOTH")){
//    printf("isawtooth\n");
//  }
//  else if(!strcmp(osc.waveform, "SQUARE")){
//    printf("isquare\n");
//  }
//  else if(!strcmp(osc.waveform, "PULSE")){
//    printf("ipulse\n");
//  }
//  else {
//    fprintf(stderr,"print_osc: %s is unknown - using sine instead\n",
//		   osc.waveform);
//    printf("isine\n");
//  }
//  sscanf(osc.omin,"%f",&omin); // convert strings to floats
//  sscanf(osc.omax,"%f",&omax);
//  if(omin != -1.0 || omax != 1.0){ // rescale output if necessary
//    mo2 = (omax - omin) / 2.0;
//    printf("%s = %s + (%f*%s + %f)\n",
//	   osc.sig_out, osc.omin, mo2, osc.sig_out, mo2);
//  }
//}
//
//void read_mix(MIXOUT *mix, int count){
//  scanf("%s %s", mix[count].outvar, mix[count].amplitude);
//}
//
//void print_instr(INSTR instr){
//  printf("\tinstr %s\n", instr.no);
//  printf("isine = 1\n");
//  printf("itriangle = 2\n");
//  printf("isawtooth = 3\n");
//  printf("isquare = 4\n");
//  printf("ipulse = 5\n");
//  printf("ifrq cpsmidib 1\n");
//}
//
//void read_instr(INSTR *instrs, int count){
//  scanf("%s", instrs[count].no);
//}
//
//void print_mix(MIXOUT mix){
//  float amplitude;
//  sscanf(mix.amplitude, "%f", &amplitude);
//  printf ("kenv linseg 0,.05,%f,p3-0.1,%f,.05,0\n", amplitude, amplitude);
//  printf("out (%s)*kenv\n", mix.outvar);
//  printf("\tendin\n\n");
//}
//
//void read_noise(NOISEMOD *unit, int count){
//  scanf("%s %s %s %s %s", unit[count].sig_out, 
//						  unit[count].speed, 
//						  unit[count].seed, 
//						  unit[count].omin, 
//						  unit[count].omax);
//}
//
//void print_noise(NOISEMOD noise){
//  float omin, omax, mo2;
//
//  printf("%s randi 1.0, %s, %s\n", noise.sig_out, noise.speed, noise.seed);
//  sscanf(noise.omin,"%f",&omin); // convert strings to floats
//  sscanf(noise.omax,"%f",&omax);
//
//  if(omin != -1.0 || omax != 1.0){
//    mo2 = (omax - omin) / 2.0;
//    printf("%s = %s + (%f*%s + %f)\n",
//           noise.sig_out, noise.omin, mo2, noise.sig_out, mo2);
//  }
//}
//
//void print_sah(NOISEMOD noise){
//  float omin, omax, mo2;
//
//  printf("%s randh 1.0, %s, %s\n", noise.sig_out, noise.speed, noise.seed);
//  sscanf(noise.omin,"%f",&omin); // convert strings to floats
//  sscanf(noise.omax,"%f",&omax);
//
//  if(omin != -1.0 || omax != 1.0){
//    mo2 = (omax - omin) / 2.0;
//    printf("%s = %s + (%f*%s + %f)\n",
//           noise.sig_out, noise.omin, mo2, noise.sig_out, mo2);
//  }
//}
//
//void read_vcf(VCFMOD *unit, int count){
//  scanf("%s %s %s %s", unit[count].sig_out,unit[count].sig_in,
//  unit[count].cutoff, unit[count].resonance );
//}
//
//void print_vcf(VCFMOD vcf){
//  printf("%s moogvcf %s, %s, %s\n", vcf.sig_out, vcf.sig_in,
//	 vcf.cutoff, vcf.resonance);
//}
//
//void read_env(ENVMOD *unit, int count){
//  scanf("%s %s", unit[count].sig_out,unit[count].amp);
//}
//
//void print_env(ENVMOD env){
//  printf("%s expsegr 0.01, 0.1, %s, 0.1, 0.001", env.sig_out, env.amp);
//}
