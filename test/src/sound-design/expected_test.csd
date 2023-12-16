<CsoundSynthesizer>
<CsOptions>
-F test.mid
</CsOptions>
sr = 48000
kr = 4800
ksmps = 10
nchnls = 1
<CsInstruments>

	instr 1
isine = 1
itriangle = 2
isawtooth = 3
isquare = 4
ipulse = 5
a1 oscil 1.0, 100, ipulse
a2 oscil 1.0, 100.1, ipulse
a3 oscil 1.0, 100.2, ipulse
a4 oscil 1.0, 100.3, ipulse
a5 oscil 1.0, 100.4, ipulse
a6 oscil 1.0, 100.5, ipulse
kenv linseg 0,.05,2000.000000,p3-0.1,2000.000000,.05,0
out (a1+a2+a3+a4+a5+a6)*kenv
	endin

</CsInstruments>
<CsScore>

f1 0 8192 10 1 ; sine
f2 0 8192 10 1 0 .111 0 .04 0 .02 0 ; triangle
f3 0 8192 10 1 .5 .333 .25 .2 .166 .142 .125 ; sawtooth
f4 0 8192 10 1 0 .333 0 .2 0 .142 0 .111; square
f5 0 8192 10 1 1 1 1 1 1 1 1 1 1 1 1 1; pulse

i1 0 10.000000

</CsScore>
</CsoundSynthesizer>
