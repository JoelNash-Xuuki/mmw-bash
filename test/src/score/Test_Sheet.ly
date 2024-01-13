\version "2.22.0"

\header {
  tagline = "Xuuki"
  title = "Title"
  composer = "Vyvn"
}
\score {
  <<
    \new StaffGroup <<
      }
     >>
    \new StaffGroup <<
      }
     >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
\version "2.22.0"

\header {
  tagline = "Xuuki"
  title = "Title"
  composer = "Vyvn"
}
\score {
  <<
    \new StaffGroup <<
        \include "/home/joel/projects_/notes/ns-3001"
      }
     >>
    \new StaffGroup <<
        \include "/home/joel/projects_/notes/ns-5001"
        \include "/home/joel/projects_/notes/ns-6001"
      }
     >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
\version "2.22.0"

\header {
  tagline = "Xuuki"
  title = "Title"
  composer = "Vyvn"
}
\score {
  <<
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Bass"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
      }
     >>
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Snare"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
      }
     >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
\version "2.22.0"

\header {
  tagline = "Xuuki"
  title = "Title"
  composer = "Vyvn"
}
\score {
  <<
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Bass"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
      }
     >>
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Snare"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
      }
     >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
