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
        instrumentName=  " "
        shortInstrumentName= " "
      } 
        \relative {
        \clef percussion
        \time 4/4
        \tempo 4 = 84
      }
    >> 
    \new StaffGroup << %Harmony
      \new Staff \with  
      { 
        instrumentName= "FM"
      } \relative {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key a \major 
         <a, e' gis cis>4 r2.
         r4 <a' cis e gis>4 r2
         <cis, gis' b dis>4 r2.
         r4 <cis gis' b e> r8 
         <cis gis' b dis>4 r8
      }
    >> 
    \new StaffGroup << %Bass
       \new Staff \with { 
         instrumentName= " "
         shortInstrumentName= " "}
        \relative  { 
         \time 4/4
         \tempo 4 = 84
         \clef bass
         \key a \major
         a,4\staccato a4\staccato r a4\staccato
         r4 r4 r8 cis8 b4\staccato  
         a4\staccato gis4\staccato r gis4\staccato 
         r fis4\staccato r8 gis4\staccato 
       }
    >>
    \new StaffGroup << %Percussion
       \new Staff \with { %Snare
         instrumentName= " "
         shortInstrumentName= " "
       } 
       {
         \tempo 4 = 84
         \clef percussion
         \xNotesOn
         r2 d4 r8 d
         r2 d4 r4
         r2 d4 r4
         r2 d4 r4
       }

      \new Staff \with { %Brush
        instrumentName= " "
        shortInstrumentName= " "
      } 
      {
        \clef percussion
        \tempo 4 = 84
        \xNotesOn
      }

      \new Staff \with { % HiHat
          instrumentName= "Hi Hat"
          shortInstrumentName= "HH" 
        }
        { 
          \clef percussion
          \tempo 4 = 84
          \xNotesOn
          d4 d d d d d d d 
          d  d d d d d d d   
        }

        \new Staff \with { %Kick
          instrumentName= " "
          shortInstrumentName= " " 
        }
        \relative { 
          \clef percussion
          \tempo 4 = 84
          
        }
    >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
