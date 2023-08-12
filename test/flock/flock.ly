

\version "2.22.0"

\header {
  tagline = "Xuuki.xyz"
  title = "flock"
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
  <fis'  d gis>2
}

harmonyb = \repeat unfold 3 \relative {
  <fis'  d a>1
}

harmonyc = \repeat unfold 1 \relative {
  <fis'  d a>2
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
        instrumentName=  "Voice"
	shortInstrumentName= "Voi"
      } 
        \relative {
        \clef percussion
        \time 4/4
        \tempo 4 = 84
        r1
	r1
        \voiceb 
        \voiceb
      }
    >> 
  \new StaffGroup << %Harmony
    \new Staff \with  
      { 
        instrumentName=  "Harmony"
        shortInstrumentName= "Hrm"
      } \relative {
      \time 4/4
      \tempo 4 = 84
      \clef bass
      \key c \major 
      r1
      r2
      \harmonya
      \harmonyb
      \harmonyc
      \harmonya
      \harmonyb
      r2

      \harmonya
      \harmonyb
      \harmonyc
      \harmonya
      \harmonyb
      \harmonyc
    }
  >> 
  \new StaffGroup << %Bass
    \new Staff \with { 
        instrumentName= "Bass"
        shortInstrumentName= "Bs"}
        { 
      \time 4/4
      \tempo 4 = 84
      \clef bass
      \key c \major
      r1
      r2. g8 g8
      \bassb
      \bassb
      \bassb
      \bassb
   }
  >>
  \new StaffGroup << %Percussion
    \new Staff \with { %Snare
	instrumentName= "Snare"
	shortInstrumentName= "Sn"
	} {
        \tempo 4 = 84
        \clef percussion
        \xNotesOn
	r1
	r1
        \snarec
        \snareb
        \snarec
        \snareb
        \snarec
        \snareb
        \snarec
        \snareb
        }
        \new Staff \with { %Brush
	instrumentName= "Brush"
	shortInstrumentName= "Bsh"
	} {
        \clef percussion
        \tempo 4 = 84
        \xNotesOn
	r1
        \brusha
        \brushb
	\brusha
        \brushb
    }
    \new Staff \with { % HiHat
      instrumentName= "Hi Hat"
      shortInstrumentName= "HH" 
    }
    { 
      \clef percussion
      \tempo 4 = 84
      r1
      r1
      \hihata
      \hihatb
      \hihata
      \hihatb
    }
    \new Staff \with { %Kick
      instrumentName= "Kick"
      shortInstrumentName= "Kc" }
      \relative { 
        \clef percussion
        \tempo 4 = 84
	r1
        r1
        \kicka
        \kickb
        \kicka
        \kickb
      }
  >>
>>
  \layout {}
  \midi {
      \tempo 4 = 84
  }
}


