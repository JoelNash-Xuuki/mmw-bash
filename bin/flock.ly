\version "2.22.0"

\header {
  tagline = "Xuuki.xyz"
  title = "Flock"
  composer = "Vyvyan"
}

\score {
  <<
    \new StaffGroup << %Melody
      \new Staff \with  { 
        instrumentName=  "Voice"
        shortInstrumentName= "Voi"
      } 
        \relative {
        \clef percussion
        \time 4/4
        \tempo 4 = 84
        r1
        \xNotesOn
        a'4.   r ges   ges r4 ges    
        des'4. r fes,   fes r4 fes
      }
    >> 
    \new StaffGroup << %Harmony
      \new Staff \with  
      { 
        instrumentName= "Harmony"
        shortInstrumentName= "Hrm"
      } \relative {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major 
        r1
        fis'1
        cis1
        cis1
        b1
        a1
        a1
        a1
        b1
        cis1
        a1
        a1
        a1
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
         r4 a, r fis,
         r r r r
         r fis, r r
         gis, r r r

         e, e, r d,
         d, r  r  r
         cis cis r r 
         r r r r

         gis,2. 
         e,2. d,8
         cis,4.
         b,,2.
         cis,1
       }
    >>
    \new StaffGroup << %Percussion
      \include "src/score/snare.ly"

       \new Staff \with { %Snare
         instrumentName= "Snare"
         shortInstrumentName= "Sn"
       } 
       {
         \tempo 4 = 84
         \clef percussion
         \xNotesOn
         d4 d d d
         r8 r r r d r r r
         r  r r r d r r r
         r8 r r r r d r r
         r  r r r d r r r

         r8 d r r d r d d
         r  d r r r d r r
         r  r r r d r r r
         r  r r r d r r r

         d8 r r r d r r r
         r  r d r d r r r
       }

      \new Staff \with { %Brush
        instrumentName= "Brush"
        shortInstrumentName= "Bsh"
      } 
      {
        \clef percussion
        \tempo 4 = 84
        \xNotesOn
        r1
        r2 r4 d
        r2 r4 d
        r2 r4 d
        r2 r4 r

        r2 r4 d
        r2 r4 d
        r2 r4 r
        r2 r4 r
      }

      \new Staff \with { % HiHat
          instrumentName= "Hi Hat"
          shortInstrumentName= "HH" 
        }
        { 
          \clef percussion
          \tempo 4 = 84
          r1
          \xNotesOn
          d8  d  d  d  d d  d   d 
          d   d  d  d  d r  r   d   
          d   d  d  d  r r  d   d
          d   d  d  d  r d  r   r

          r8   d     r   d   r d d r
          d8   d     r   d   r d d d  
          d    d     d   r   d r d r 
          d    d     d   d   r d d d

          r d d d r d d d
          d d d d d r r d
        }

        \new Staff \with { %Kick
          instrumentName= "Kick"
          shortInstrumentName= "Kc" 
        }
        \relative { 
          \clef percussion
          \tempo 4 = 84
          r1
          r4 d r d
          d r r  r
          d r d  r
          r d d  d

          r8 d4 r d4 r8
          r8 d4 r4. d4 
          d r r r
          r d r r
        }
    >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
