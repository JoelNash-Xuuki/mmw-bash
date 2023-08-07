;www.csounds.com/tootsother/east/StepSeq/StepSeq.html
f1	0	8192	10	1							
;Notes
f100 0 8 -2	7.00 7.03 7.02 7.06	7.05 7.09 7.08 7.12
f101 0 4 02	6.04 6.08 6.11 7.04				

;Envelopes
f200 0 8192	-7 	0.5 4096 1 4096 1			
f201 0 8192 	-5   	.01 128 1  8054  1	
f202 0 8192 	-5   	.01 256 1  7926  1	

;Volume play
f300 0 8 -2	1 1	1 1	1 1	1 1
f301 0 4 -2	2 1	1 1	     		
f302 0 8 -2	2 0	1 0	1 0	2 0

;Pan
f400 0 7 -2	1 0	1 .25 .75 0	.5 .25
f401 0 1 -2	0.5
f402 0 5 -2	0 0.5 1 0.5 0  

;pwm
f500 0 8192	-7 1 8192 0					
f501 0 8192	-7 1 4096 0	4096 1

;VCF
f600 0 8192	-7	500	 8192	6000					
f601 0 1 -2	10000
f602 0 1 -2	1000

;Res
f700 0 8 -2	.1 .1 .1 .1	.1 .1 .1 .1
f701 0 8192	-7 .9 8192 0					
f702 0 8192	-5 .8 4096 .2 4096 .8

;HPF
f901 0 1 -2	10000
f902 0 1 -2	20
f903 0 1 -2	15000
f904 0 1 -2	55
f905 0 1 -2	440
f906 0 1 -2	220

;PCH
f9001 0 1 -2	1
f9002 0 512  -5  .001 64 1 442 1 6 .001			
f9003 0 512  -5  2 64 1 221 0.99 221 1 6 2			
f9004 0 512  -5  0.9 32 0.999 32 1  215 1 3 1.00 4 1 122 0.999 70 0.99 15 0.9 15 0.1
f9006 0 2 -2	0.9 0.5  
f9005 0 512  -5  0.001 64 1 221 1 191 1 36 .001			
f9007 0 1 -2	1.2  
f9014 0 1 -2	1.9  
f9015 0 1 -2	1.05 
f9016 0 1 -2	0.5 
f9008 0 1 -2	1.01  
f9009 0 1 -2	2
f9010 0 1 -2	2.01
f9011 0 1 -2	0.99
f9012 0 1 -2	0.97
f9013 0 1 -2	0.95

f111 0 1024 10 1
f1001 0   8193    10  1
; Load proj wav file and point to each channel
f1002 0 0 1 "test-project-1-sound-design-1.wav" [0.714*4] 4 2 ; Harmony 

t 0 84 ; tempo

{ 2 r
  ;i1   [$r * 1]        1 0.02   1 100 9001 201 300 401 500 601 700 1001 906 9001 0 0 0 0  ; voice 
  i1   [$r * 1]        1 0.45   1 100 9001 201 300 401 500 601 700 1002 906 9001 0 0 0 0  ; Harmony 
  ;i1   [$r * 1]        1 0.6    1 100 9001 201 300 401 500 602 700 1003 902 9001 0 0 0 1  ; Bass
  ;i1   [$r * 1]        1 0.5    1 100 9001 201 300 401 500 601 700 1004 906 9001 0 0 0 1  ; Snare   
  ;i1   [$r * 2]       1 0.07   1 100 9001 201 300 401 500 601 700 1006 901 9001 0 0 0 1  ; HiHat   
  ;i1   [$r * 2]       1 0.03   1 100 9001 201 300 401 500 601 700 1005 903 9001 0 0 0 1  ; Brush
  ;i1   [$r * 2]       1 0.95   1 100 9001 201 300 401 500 601 700 1007 902 9001 0 0 0 1  ; Kick
}
s

t 0 84 ; tempo
#define Dur#32#

{ 4 r

  i199 [$r * $Dur]   $Dur 2.856 0.914 ;reverb
  i198 [$r * $Dur]   $Dur 0.714 0.914 ;delay
  ;i1   [$r * $Dur]  $Dur 0.02  1 100 9001 200 300 401 500 601 700 1001 906 9001 0 0 0 0  ; voice 
  i1   [$r * $Dur]   $Dur 0.85   1 100 9001 200 300 401 500 601 700 1002 906 9001 0 0 0 0  ; Harmony 
  ;i1   [$r * $Dur]  $Dur 0.6   1 100 9001 201 300 401 500 602 700 1003 902 9001 0 0 0 1  ; Bass
  ;i1   [$r * $Dur]   $Dur 0.25   1 100 9001 201 300 401 500 601 700 1004 906 9001 0 0 1 1  ; Snare   
  ;i1   [$r * $Dur]    $Dur 0.07   1 100 9001 201 300 401 500 601 700 1006 901 9001 0 0 0 1  ; HiHat   
  ;i1   [$r * $Dur]    $Dur 0.03   1 100 9001 201 300 401 500 601 700 1005 903 9001 0 0 0 1  ; Brush
  ;i1   [$r * $Dur]    $Dur 0.75   1 100 9001 201 300 401 500 601 700 1007 902 9001 0 0 0 1  ; Kick
}
s

; empty tables
;f-1002 0 0 1 "/home/joel/audio/202210030854-idea.wav"         [0.714*4] 4 2 ; Harmony 


