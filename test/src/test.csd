<CsoundSynthesizer>
<CsOptions>
  -W -d -o /home/joel/mmw/tmp/tone.wav
</CsOptions>

;-W: Enables warnings. Csound will display warning messages during the rendering process if there are any issues or potential problems in the Csound code.
;-d: Enables debug mode. Csound will display debug information during the rendering process, which can be useful for troubleshooting and understanding the internal workings of Csound.
;-o tone.wav: Specifies the output file name as "tone.wav". This flag determines the name and format of the rendered audio file. In this case, the rendered audio will be saved as a WAV file with the name "tone.wav".

<CsVersion>    ; optional section
  After 6.10   
</CsVersion>

<CsInstruments>
  ; originally tone.orc
  sr = 44100
  kr = 4410
  nchnls = 1
  instr   1
      a1 oscil p4, p5, 1 ; simple oscillator
         out a1
  endin
</CsInstruments>

<CsScore>
  ; originally tone.sco
  f1 0 8192 10 1
  i1 0 1 20000 1000 ; play one second of one kHz tone
  e
</CsScore>

</CsoundSynthesizer>
