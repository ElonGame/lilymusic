\version "2.12.0"
#(set-global-staff-size 16)

\header {
  dedication = "Herrn Professor Carl Riedel gewidmet."
  title = "Der 94ste Psalm."
  subtitle = "Sonate für die Orgel."
  composer = "Julius Reubke (1834-1858)"
  copyright = \markup \center-column {
    \line {
      Edited, engraved and copyright © 2009 by
      \with-url #"http://www.wilbertberendsen.nl/"
      { Wilbert Berendsen (http://www.wilbertberendsen.nl/) }
    }
    \line {
      This edition may be freely copied, distributed,
      performed and recorded under the provisions of the
    }
    \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/nl/"
    \line {
      Creative Commons License (BY-NC-SA,
      http://creativecommons.org/licenses/by-nc-sa/3.0/nl/)
    }
  }
}

\paper {
  %#(set-paper-size "a4" 'landscape)
  max-systems-per-page = #5
}

\layout {
  \context {
    \Score
    \override PaperColumn #'keep-inside-line = ##t 
    %\override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 2 16)
  }
  \context {
    \Staff
    \override TextScript #'staff-padding = #1
    \override BreathingSign #'text = #(make-musicglyph-markup "scripts.caesura.curved")
  }
  \context {
    \Voice
    \override DynamicTextSpanner #'dash-period = #6
    \override DynamicTextSpanner #'dash-fraction = #0.08
    \override DynamicTextSpanner #'font-size = #0
  }
}

scoreSetup = <<
  \new PianoStaff <<
    \new Staff = "rh" \with {
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)
    } \new Voice = "rh" {
      \clef treble
      #(set-accidental-style 'piano)
    }
    \new Staff = "lh" \with {
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)
    } \new Voice = "lh" {
      \clef bass
      #(set-accidental-style 'piano)
    }
  >>
  \new Staff = "ped" \with {
    \override VerticalAxisGroup #'minimum-Y-extent = #'(-2 . 4)
  } \new Voice = "ped" {
    \clef bass
    #(set-accidental-style 'piano 'Staff)
  }
>>

\include "1-grave.ly"
\include "2-larghetto.ly"
\include "3-allegro.ly"
\include "4-adagio.ly"
\include "5-fuga.ly"
\include "6-piumosso.ly"

music = {
  \scoreSetup
  \graveMusic
  \larghettoMusic
  \allegroMusic
  \adagioMusic
  \fugaMusic
  \piumossoMusic
}  

\score {
  \music
}
