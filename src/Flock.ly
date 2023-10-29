\version "2.22.0"
  
\header {
  tagline = "Xuuki.xyz"
  title = "Flock"
  composer = "Vyvyan"
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
      }
    >> 
  \new StaffGroup << %Harmony
    \include "src/score/harmony.ly"
  >> 
  \new StaffGroup << %Bass
    \include "src/score/bass.ly"
  >>
  \new StaffGroup << %Percussion
    \include "/home/joel/projects_/flock/src/score/snare.ly"
    \include "/home/joel/projects_/flock/src/score/brush.ly"
    \include "/home/joel/projects_/flock/src/score/hihat.ly"
    \include "src/score/kick.ly"
  >>
>>
  \layout {}
  \midi {
      \tempo 4 = 84
  }
}

  
