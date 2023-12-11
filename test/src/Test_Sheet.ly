\version "2.22.0"

\header {
  \tagline = "Xuuki"
  \title = "Title"
  \composer = "Vyvn"
}
\score {
  <<
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Bass"
      }

      {
        \time 4/4
        \tempo 84
        \clef bass
        \key c \major
        \include "/home/joel/projects_/Hello/src/score/notes/ns-3001"
      }
