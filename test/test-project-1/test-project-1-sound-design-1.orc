sr		  = 48000
kr 		  = 4800
ksmps	  = 10
nchnls    = 9
0dbfs	  = 1

;gah	  init 0
;gahh	  init 0

; Instr Definitions
#define   voice #1#
#define   harmony #2# 
#define   bass #3#
#define   snare #4#
#define   brush #5#
#define   hihat #6#
#define   kick #7#

;Map Midi Channels
massign   $voice, $voice
massign   $harmony, $harmony
massign   $bass, $bass
massign   $snare, $snare
massign   $brush, $brush
massign   $hihat, $hihat
massign   $kick, $kick 

;Globals
gicps  	  init 256

          instr $voice
ivibdel   = 0.114
iamp      veloc 0, 0.25
kfrq      cpsmidib 2
kenv      linsegr 0.001, 0.950, iamp, 0.950, 0.001
kvibenv   linseg 0.001, ivibdel, 0.1, ivibdel, 0.001

kfrq      = kfrq*1

klfo      oscil kvibenv, 0.714, 1
kindex    expon 1, 0.2, 0.30

asig1     oscili  kenv*iamp, kfrq, 1
asig2     oscili  kenv*iamp, kfrq*1.005, 1
asig3     oscili  kenv*iamp, kfrq*.995, 2
asig4     foscil  kenv, kfrq, 3.5, 2.5, kindex

amix      = (asig1+(asig2*0.015)+(asig3*0.015)+(asig4*0.00006))*6
anoise    rand kfrq
;afilt     tone adis+(anoise*0.0000005*klfo), 1000
alpf      butterlp amix, 20000 ; cut freqs above
ahpf      butterhp alpf, 105  ; pass fres above
          outch $voice, (ahpf*kenv)
          endin


          instr $harmony ;character
ivibdel   = 0.714
iamp      veloc 0, 0.25
kfrq      cpsmidib 0.95
kenv      linsegr 0.001, 0.614, iamp, 0.614, 0.001
kvibenv   linseg 0.001, ivibdel, 1, ivibdel, 0.001

klfo      oscil kvibenv, 0.357, 1
kindex    expon 1, 0.2, 0.30

asig1     oscili  kenv*iamp, kfrq, 1
asig2     oscili  kenv*iamp, kfrq*1.005, 1
asig3     oscili  kenv*iamp, kfrq*.995, 2
asig4     foscil  kenv, kfrq, 3.5, 2.5, kindex

amix      = (asig1+(asig2*0.5)+(asig3*0.01)+(asig4*0.0005))*6
anoise    rand kfrq
;afilt     tone adis+(anoise*0.0000025*klfo), 1000
alpf     butterlp amix, 300 ;cut freqs above
ahpf     butterhp alpf, 100 ;pass freqs above

          outch $harmony, (ahpf*kenv)
          endin

         

  instr $bass 
idec 	  = 3
iamp 	  veloc 0, 1 
kfrq 	  cpsmidib 1
kenv 	  expsegr 0.9, idec, 0.01, 0.5, 0.001

asig 	  oscili  kenv*iamp, kfrq, 1 

afilt	  tone asig, 150

	      outch $bass, afilt
		  endin
  instr $snare
idur 	  = 0.01
iamp 	  veloc 0, 0.8
ifrq 	  cpsmidib 1
iatk	  =		.01
irel	  =		.01
icf1	  =		15000
icf2	  =		100
ibw1	  =		10
ibw2	  =		1900
ipan	  =		0.5
kenv	  expseg	.001, iatk, iamp, idur/6, iamp*.4, idur-(iatk+irel+idur/6), iamp*.6, irel,.01
asig	  rand	ifrq
kcf		  expon	icf1, idur, icf2
kbw		  line	ibw1, idur, ibw2
afilt	  reson	asig*0.01, kcf, kbw, 2
	      outch $snare, (afilt*kenv)*ipan

		  endin
instr $brush
idur 	= 1.357
iamp 	veloc 0, 0.002
ifrq 	cpsmidib 1
iatk	=		1.357
irel	=		1.357
icf1	=		22000
icf2	=		2500
ibw1	=		22000
ibw2	=		15000
ipan	=		0.5
kenv	expseg	.001, iatk, iamp, idur/6, iamp, idur-(iatk+irel+idur/6), iamp, irel,.01
asig	rand	ifrq
kcf		expon	icf1, idur, icf2
kbw		line	ibw1, idur, ibw2
afilt	reson	asig*0.01, kcf, kbw, 2
klfo	oscil   1.428, 0.714, 1
		outch   $brush, ((afilt*klfo)*kenv)*ipan
		endin


instr $hihat
idur      = 0.001
iamp      veloc 0, 1
ifrq      cpsmidib 1
iatk      =                .00714
irel      =                .0357
icf1      =                17850
icf2      =                714
ibw1      =                714
ibw2      =                7140
ipan      =                0.5
kenv      expseg        .001, iatk, iamp, idur/6, iamp*.4, idur-(iatk+irel+idur/6), iamp*.6, irel,.01

; ;kenv linsegr 0, .1, 1, .05, .75, .2, 0
;; generate a modulation signal that follows the pitch of the note
;  kmod = foscil(kenv, ifrq, 1) * 500
;;  kcut modfilt kmod, ifrq, 12
;
;; VCO
asig      rand ifrq
;

kcf               expon icf1, idur, icf2
kbw               line  ibw1, idur, ibw2
afilt     reson asig, kcf, kbw, 2

;min_value = 400
;max_value = 2000
;min_ifrq = 400
;max_ifrq = 2000
;s_ifrq = min_value + (ifrq - min_ifrq) * (max_value - min_value) / (max_ifrq - min_ifrq)



;afilp_lp   lowres  afilt, s_ifrq, 90

;
;
;;
;
            outch $hihat, ((afilt*kenv)*ipan) * .02
                endin


instr $kick
idur		=	 0.2	
imaxamp 	veloc 	0, 0.7
icarrfreq	=		32.7
imodfreq	=		40
ilowndx		=		0.1
indxdiff	=		5-0

 ;PARAMETERS DEFINING THE ADSR AMPLITUDE ENVELOPE
 ;TIMES ARE A PERCENTAGE OF p3
 ;  attack amp  = p9     attack length  = p14
 ;  decay amp   = p10    decay length   = p15
 ;  sustain amp = p11    sustain length = p16
 ;  release amp = p12    release length = p17
 ;  end amp     = p13

 ;;PARAMETERS DEFINING THE ADSR FREQ DEVIATION ENVELOPE
 ;;TIMES ARE A PERCENTAGE OF p3
 ;  attack amp  = p18    attack length  = p23
 ;  decay amp   = p19    decay length   = p24
 ;  sustain amp = p20    sustain length = p25
 ;  release amp = p21    release length = p26
 ;  end amp     = p22

aampenv		linseg	.75, .125*idur, .8, .125*idur, 1.0, .25*idur, .15, .5*idur, .0
adevenv		linseg	1.0, .125*idur, .0, .25*idur, .0, .25*idur, .0, .25*idur, .0
amodosc		oscili	(ilowndx+indxdiff*adevenv)*imodfreq, imodfreq, 1
acarosc		oscili	imaxamp*aampenv, icarrfreq+amodosc, 1
			outch $kick, acarosc
			endin
