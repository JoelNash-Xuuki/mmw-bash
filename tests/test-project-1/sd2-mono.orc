; www.csounds.com/tootsother/east/StepSeq/StepSeq.html
sr        =      48000
kr        =      480
ksmps     =      100
nchnls    =      2
0dbfs	  =      1

#define st # 0.714#
garvb 	     	  init      0
gacmb	     	  init      0


          instr     1801
ia 	  =         cpspch(p5)
ib 	  =         cpspch(p6)
idec      =         0.021
ipan             =         p7
kenv              expsegr   0.03, idec, p3, idec, 0.03
kfr               linseg    ia, p3*.5, ib, p3*.5, ib           ;p5 = FREQ OF LAST NOTE
asig              oscil     p4*kenv, kfr, 1001                 ;p6 = FREQ FOR THIS NOTE
                  outs      asig*ipan, asig*(1-ipan) 
                  endin

		  instr      1010			
		  idec       =       0.021
		  kenv       expsegr 0.02, idec, 1, idec, 0.01
                  idur	     =	p3	
                  iamp	     =	p4	
                  ispd       =  p5
                  ;ipch      =  261.6256
	          iwave      =	p6	
                  ifpch      =	p7	
	  	  ifenv	     =	p8
	  	  iacc	     =	p9
		  ipan	     =	p10
		  ifpwm	     =	p11
		  ifvcf	     =  p12
	          ifres      =  p13		
		  ifsamp     =  p14
		  ifhpf	     =  p15
                  ifsampSpd  =  p16	
		  irvbsnd    =	p17
		  icmbsnd    =  p18
                  ilength    =	ftlen(ifpch)	
                  ilenv	     =	ftlen(ifenv)	
                  ilpwm	     =	ftlen(ifpwm)	
	  	  ilvcf      =  ftlen(ifvcf)
	  	  ires	     =  ftlen(ifres)
	  	  ilhpf      =  ftlen(ifvcf)
	  	  ilsamp     =  ftlen(ifsamp)
	  	  ilsampSpd  =  ftlen(ifsampSpd)
aclock	          phasor	1/idur
asampSpd          phasor	1/idur
kclock	          downsamp	aclock
ktpch	          table	kclock * ilength, ifpch, 0, 0, 1
atenv	          table	aclock * ilenv * ilength, ifenv, 0,0, 1
atacc	          table	aclock * ilength, iacc, 0, 0, 1
atpan	          table	aclock * ilength, ipan, 0, 0, 1
ktpwm	          table	kclock * ilpwm * ilength, ifpwm, 0, 0, 1
atvcf	          table	aclock * ilvcf, ifvcf, 0, 0, 1
atres	          table	aclock * ilpwm * ilength, ifpwm, 0, 0, 1
athpf	          table	aclock * ilhpf, ifhpf, 0, 0, 1
ilookup           tableng ifsamp

kindex            = 	     (ilookup/sr) * 1
iskip             =          int(p19*sr)          		      ; STARTING SAMPLE IN SECONDS
ilast             =          int(sr*p3*p20)+iskip 		      ; ENDING SAMPLE IN SECONDS
aread             line       iskip, p3, ilast    		      ; a-rate TABLE INDEX
aindex            phasor     1/kindex
phaseSet          = 	     0
                  aindex     = aindex + phaseSet




kpch	          =	     cpspch(ktpch)
asnd              tablei     aread, p14        		      	      ; SCANS FTABLE 1

; Adjust the values below to control the auto-tune effect
iScaleFactor = 0.1 ; Scale factor for the pitch correction (0.0 - 1.0)
iTimeConstant = 0.005 ; Time constant for the pitch correction (in seconds)

; Enable input and output
;aInL, aInR ins

; Apply auto-tune effect

ifftsize  = 2048
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1	

; analysis the signal
fasndanal  pvsanal asnd, ifftsize, ioverlap, iwinsize, iwinshape
; get the
kfr, kamp pvspitch  fasndanal, 0.01

asnd pvsynth fasndanal


asamp 	          loscil     kenv*iamp, 261.6256*ktpch, p14, 261.6256, 0   
avco1	          vco	     1, kpch, iwave, ktpwm, 1, 1/(cpspch(7.00))
avco2	          vco	     1, kpch * .994, iwave, ktpwm, 1, 1/(cpspch(7.00))
avco	          =	     (avco1 + avco2)*0.01
ahp	          butterhp  asnd, athpf, 1000 
avcf	          moogvcf ahp, atvcf, 0 ;atres to be here but the sound peaks



;avcf	          = avcf * iamp * atenv * atacc
agate	          linseg	0, .015625, 1, idur - .03125, 1, .015625, 0


                  outs	avcf * (sqrt(1-atpan)) * agate, avcf *  sqrt(atpan) * agate

amix		  = avcf
garvb	          = garvb+(amix*irvbsnd)
gacmb	          = gacmb+(amix*icmbsnd)
                  endin


		  instr      1			
		  idec       =       0.021
		  kenv       expsegr 0.02, idec, 1, idec, 0.01
                  idur	     =	p3	
                  iamp	     =	p4	
                  ispd       =  p5
                  ;ipch      =  261.6256
	          iwave      =	p6	
                  ifpch      =	p7	
	  	  ifenv	     =	p8
	  	  iacc	     =	p9
		  ipan	     =	p10
		  ifpwm	     =	p11
		  ifvcf	     =  p12
	          ifres      =  p13		
		  ifsamp     =  p14
		  ifhpf	     =  p15
                  ifsampSpd  =  p16	
		  irvbsnd    =	p17
		  icmbsnd    =  p18
                  ilength    =	ftlen(ifpch)	
                  ilenv	     =	ftlen(ifenv)	
                  ilpwm	     =	ftlen(ifpwm)	
	  	  ilvcf      =  ftlen(ifvcf)
	  	  ires	     =  ftlen(ifres)
	  	  ilhpf      =  ftlen(ifvcf)
	  	  ilsamp     =  ftlen(ifsamp)
	  	  ilsampSpd  =  ftlen(ifsampSpd)
aclock	          phasor	1/idur
asampSpd          phasor	1/idur
kclock	          downsamp	aclock
ktpch	          table	kclock * ilength, ifpch, 0, 0, 1
atenv	          table	aclock * ilenv * ilength, ifenv, 0,0, 1
atacc	          table	aclock * ilength, iacc, 0, 0, 1
atpan	          table	aclock * ilength, ipan, 0, 0, 1
ktpwm	          table	kclock * ilpwm * ilength, ifpwm, 0, 0, 1
atvcf	          table	aclock * ilvcf, ifvcf, 0, 0, 1
atres	          table	aclock * ilpwm * ilength, ifpwm, 0, 0, 1
athpf	          table	aclock * ilhpf, ifhpf, 0, 0, 1
ilookup           tableng ifsamp

;;;;;;;;;;;;;;     instr 201
;iamp	  	   =	      p4
;iskip             =           int(p5*sr)          		      ; STARTING SAMPLE IN SECONDS
;ilast             =           int(sr*p3*p6)+iskip 		      ; ENDING SAMPLE IN SECONDS

;idec              =           0.020
;kenv              linseg      0, .05, iamp, p3-.071, iamp, .02, 0     ; ENV FUNCTION
;aread             line        iskip, p3, ilast    		      ; a-rate TABLE INDEX
;aread            line        ilast, p3, iskip    		      ; OPTIONAL: ilast TO iskip READS BACKWARD
;asnd              tablei      aread, p7        		      	      ; SCANS FTABLE 1

;asig             =           asnd*kenv           		      ; IMPOSES ENVELOPE
;;;;;;;;;;

kindex            = 	     (ilookup/sr) * 1
iskip             =          int(p19*sr)          		      ; STARTING SAMPLE IN SECONDS
ilast             =          int(sr*p3*p20)+iskip 		      ; ENDING SAMPLE IN SECONDS
aread             line       iskip, p3, ilast    		      ; a-rate TABLE INDEX
aindex            phasor     1/kindex
phaseSet          = 	     0
                  aindex     = aindex + phaseSet
                  ;aindex    = aindex * ilookup
                  ;asamp     table aindex, ifsamp, 1
                  ;asamp     = asamp * iamp
kpch	          =	     cpspch(ktpch)
asnd              tablei     aread, p14        		      	      ; SCANS FTABLE 1
asamp 	          loscil     kenv*iamp, 261.6256*ktpch, p14, 261.6256, 0   

; Apply auto-tune effect
;
;ifftsize  = 2048
;ioverlap  = ifftsize / 4
;iwinsize  = ifftsize
;iwinshape = 1	
;
;; analysis the signal
;fasndanal  pvsanal asamp, ifftsize, ioverlap, iwinsize, iwinshape
;; get the
;kfr, kamp pvspitch  fasndanal, 0.01
;
;asamp pvsynth fasndanal
;
;


avco1	          vco	     1, kpch, iwave, ktpwm, 1, 1/(cpspch(7.00))
avco2	          vco	     1, kpch * .994, iwave, ktpwm, 1, 1/(cpspch(7.00))
avco	          =	     (avco1 + avco2)*0.01
ahp	          butterhp  asamp, athpf, 1000 
avcf	          moogvcf ahp, atvcf, 0 ;atres to be here but the sound peaks



;avcf	          = avcf * iamp * atenv * atacc
agate	          linseg	0, .015625, 1, idur - .03125, 1, .015625, 0

                  outs	avcf * (sqrt(1-atpan)) * agate, avcf *  sqrt(atpan) * agate

amix		  = avcf
garvb	          = garvb+(amix*irvbsnd)
gacmb	          = gacmb+(amix*icmbsnd)
                  endin

		  instr      5555			
		  idec       =       0.021
		  kenv       expsegr 0.02, idec, 1, idec, 0.01
                  idur	     =	p3	
                  iamp	     =	p4	
                  ispd       =  p5
                  ;ipch      =  261.6256
	          iwave      =	p6	
                  ifpch      =	p7	
	  	  ifenv	     =	p8
	  	  iacc	     =	p9
		  ipan	     =	p10
		  ifpwm	     =	p11
		  ifvcf	     =  p12
	          ifres      =  p13		
		  ifsamp     =  p14
		  ifhpf	     =  p15
                  ifsampSpd  =  p16	
		  irvbsnd    =	p17
		  icmbsnd    =  p18
                  ilength    =	ftlen(ifpch)	
                  ilenv	     =	ftlen(ifenv)	
                  ilpwm	     =	ftlen(ifpwm)	
	  	  ilvcf      =  ftlen(ifvcf)
	  	  ires	     =  ftlen(ifres)
	  	  ilhpf      =  ftlen(ifvcf)
	  	  ilsamp     =  ftlen(ifsamp)
	  	  ilsampSpd  =  ftlen(ifsampSpd)
aclock	          phasor	1/idur
asampSpd          phasor	1/idur
kclock	          downsamp	aclock
ktpch	          table	kclock * ilength, ifpch, 0, 0, 1
atenv	          table	aclock * ilenv * ilength, ifenv, 0,0, 1
atacc	          table	aclock * ilength, iacc, 0, 0, 1
atpan	          table	aclock * ilength, ipan, 0, 0, 1
ktpwm	          table	kclock * ilpwm * ilength, ifpwm, 0, 0, 1
atvcf	          table	aclock * ilvcf, ifvcf, 0, 0, 1
atres	          table	aclock * ilpwm * ilength, ifpwm, 0, 0, 1
athpf	          table	aclock * ilhpf, ifhpf, 0, 0, 1
ilookup           tableng ifsamp

kindex            = 	     (ilookup/sr) * 1
iskip             =          int(p19*sr)          		      ; STARTING SAMPLE IN SECONDS
ilast             =          int(sr*p3*p20)+iskip 		      ; ENDING SAMPLE IN SECONDS
aread             line       iskip, p3*ispd, ilast    		      ; a-rate TABLE INDEX

aindex            phasor     1/kindex
phaseSet          = 	     0
                  aindex     = aindex + phaseSet
                  ;aindex    = aindex * ilookup
                  ;asamp     table aindex, ifsamp, 1
                  ;asamp     = asamp * iamp
kpch	          =	     cpspch(ktpch)
asnd              tablei     aread, p14        		      	      ; SCANS FTABLE 1
asamp 	          loscil     kenv*iamp, 261.6256*ktpch, p14, 261.6256, 0   
avco1	          vco	     1, kpch, iwave, ktpwm, 1, 1/(cpspch(7.00))
avco2	          vco	     1, kpch * .994, iwave, ktpwm, 1, 1/(cpspch(7.00))
avco	          =	     (avco1 + avco2)*0.01
ahp	          butterhp  (asnd*iamp)*atenv, athpf, 1000 

avcf	          moogvcf ahp, atvcf, 0 ;atres to be here but the sound peaks
asig 		  = avcf*iamp

;avcf	          = avcf * iamp * atenv * atacc
agate	          linseg	0, .015625, 1, idur - .03125, 1, .015625, 0
                  outs	asig * (sqrt(1-atpan)) * agate, asig *  sqrt(atpan) * agate
amix		  = avcf
garvb	          = garvb+(amix*irvbsnd)
gacmb	          = gacmb+(amix*icmbsnd)
                  endin





		  instr 201               
iamp	  	  =	      p4
iskip             =           int(p5*sr)          		      ; STARTING SAMPLE IN SECONDS
ilast             =           int(sr*p3*p6)+iskip 		      ; ENDING SAMPLE IN SECONDS
idec              =           0.020
kenv              linseg      0, .05, iamp, p3-.51, iamp, .02, 0     ; ENV FUNCTION
aread             line        iskip, p3, ilast    		      ; a-rate TABLE INDEX
;aread            line        ilast, p3, iskip    		      ; OPTIONAL: ilast TO iskip READS BACKWARD
asnd              tablei      aread, p7        		      	      ; SCANS FTABLE 1

asig              =           asnd*kenv           		      ; IMPOSES ENVELOPE
                  outs        asig, asig
                  endin

		  instr	        198
idur		  =		p3	
itime		  =		p4
iloop		  =		p5
kenv		  linen	        1, .01, idur, .01	
acomb		  comb		gacmb, itime, iloop, 0
		  outs		acomb, acomb
gacmb		  =		0

		  endin

	          instr 	199
idur	          =	p3					
irvbtim	          =	p4
ihiatn	          =	p5
arvb	          nreverb	garvb, irvbtim, ihiatn
	         	outs	arvb, arvb
garvb	          =	0
	          endin
