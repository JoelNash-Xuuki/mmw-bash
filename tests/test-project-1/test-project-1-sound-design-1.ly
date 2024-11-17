\version "2.22.0" 
\header {
  tagline = "Xuuki.xyz"
  title = "XXXXXXXXXXXX"
  composer = "Vyvyan"
}
voicea = \relative{
   \xNotesOn
   r  a'4. r a a 
   r2 a4   a r4
   r  r    a r 
}

voiceb = \repeat unfold 1 \relative {
 a'4.   r ges   ges r4 ges    
 des'4. r fes,   fes r4 fes
}

harmonya = \repeat unfold 1 \relative { 
  <a b e   >1
  <a b e   >1
  <a b e   >1
  <a b e   >1
  <aes bes ees  >1
  <aes bes ees  >1
  <aes bes ees  >1
  <aes bes ees  >1
   
}

harmonyb = \repeat unfold 1 \relative {
  <a e a c>1
  <a e a c>1
  <a e a c>1
  <a e a c>1
  <aes ees aes c>1
  <aes ees aes c>1
  <aes ees aes c>1
  <aes ees aes c>1
  <e a e c>1
  <e a e c>1
  <e a e c>1
  <e a e c>1

  <a e a c>1
  <a e a c>1
  <a e a c>1
  <a e a c>1

<f c' cis,>1
  <f c' cis,>1
  <f c' cis,>1



}
harmonyc = \repeat unfold 8 \relative {
  <fis  d a'>1
  <fis  d a'>1
  <fis  d a'>1
  <fis  d a'>1

  %<f c' cis, aes'>1 
}

brusha = \repeat unfold 1 \relative {
  \xNotesOn
   r2 r4 d
   r2 r4 d
   r2 r4 d
   r2 r4 r
}

brushb = \repeat unfold 1 \relative {
  \xNotesOn
   r2 r4 d
   r2 r4 d
   r2 r4 r
   r2 r4 r
}

hihata =  \repeat unfold  1 \relative {
  \xNotesOn
   b8   des   des   des r r   des des  
   des  des   des   des r r   des des 
   b8   des   des   r   r des des des
   des  des   des   des r r   r   r
}

hihatb =  \repeat unfold  1 \relative {
  \xNotesOn
   r8   r     des   r   r des des des
   b8   des   r     des r des  des des  
   des  des   des   des r r   des r 
   des  des   des   des r r   r   r
}

snarea = \repeat unfold 8 \relative { 
 r8 r r r d r r r
 r d r r d r r r
}

snareb = \repeat unfold 1 \relative { 
 r8 r r r d r r r
 r d r r r r r r
}

snarec = \repeat unfold 1 \relative { 
 r8 r r r d r r r
 r r r r d r r r
}

kicka = \repeat unfold 2 \relative {
  d8 d r r d r r r
  r8 d r r d r r d
}

kickb = \repeat unfold 2 \relative {
  d8 d d r d r r r
  r8 r d d r r d d
}

bassa = \repeat unfold 1 \relative {
 a,4. r a a 
 r2 a4 a r4
 r  r  a r r
}

bassb = \repeat unfold 1 \relative {
 a,4.   r ges   ges r4 ges    
 des'4. r fes,  fes r4 fes
}

\score {
  <<
    \new StaffGroup << %Melody
      \new Staff = "voice" \with  { %Voice
        instrumentName=  "Voice "
	shortInstrumentName= "Voi "
      } 
        \relative {
        \clef percussion
        \time 4/4
        \tempo 4 = 84
        r1
        \voiceb 
        \voiceb
        \voicea 
      }
    >> 
  \new StaffGroup << %Harmony
    \new Staff \with  
      { 
        instrumentName=  "Harmony "
        shortInstrumentName= "Hrm "
      } \relative {
      \time 4/4
      \tempo 4 = 84
      \clef bass
      \key c \major 
      r1
      \harmonyc
      \harmonyc
    }
  >> 
  \new StaffGroup << %Bass
    \new Staff \with { 
        instrumentName= "Bass "
        shortInstrumentName= "Bs "}
        { \time 4/4
      \clef bass
      \key c \major
      r1
      \bassb
      \bassb
      \bassa
   }
  >>
  \new StaffGroup << %Percussion
    \new Staff \with { %Snare
	instrumentName= "Snare "
	shortInstrumentName= "Sn "
	} {
        \clef percussion
        \xNotesOn
	r1
        \snarec
        \snareb
        \snarec
        \snareb
    }
    \new Staff \with { %Brush
	instrumentName= "Brush "
	shortInstrumentName= "Bsh "
	} {
        \clef percussion
        \xNotesOn
	r1
        \brusha
        \brushb
    }
    \new Staff \with { % HiHat
      instrumentName= "Hi Hat "
      shortInstrumentName= "HH" 
    }
    { \clef percussion
      r1
      \hihata
      \hihatb
      \hihata
    }
    \new Staff \with { %Kick
      instrumentName= "Kick"
      shortInstrumentName= "Kc" }
      \relative { 
        \clef percussion
	r1
        \kicka
        \kickb
        \kicka
      }
  >>
>>
  \layout {}
  \midi {
      \tempo 4 = 84   
  }
}
