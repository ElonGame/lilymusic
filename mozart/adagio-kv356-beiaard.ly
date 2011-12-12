\version "2.13.34"

\include "merge-rests.ily"

\header {
  title = "ADAGIO"
  subtitle = "K. 356"
  composer = "Wolfgang Amadeus Mozart (1756-1791)"
  arranger = "Carillon arrangement by Wilbert Berendsen (*1971)"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/web/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }  
}

\paper {
  ragged-last-bottom = ##f
  indent = #0
  systems-per-page = #6
}

\layout {
  \context {
    \Staff
    \RemoveEmptyStaves
  }
  \context {
    \Voice
    \override VoiceFollower #'style = #'dashed-line
  }
}

toManual = {
  \change Staff = "manual"
  \voiceTwo
}

toPedal = {
  \change Staff = "pedal"
  \oneVoice
}

icc = \once \override NoteColumn #'ignore-collision = ##t
showSwitch = { \once \set followVoice = ##t }
plusDown = #(define-music-function (parser location note) (ly:music?)
	      #{ << $note \new Voice { \voiceTwo $note } >> #})
plusUp = #(define-music-function (parser location note) (ly:music?)
	      #{ << $note \new Voice { \voiceOne $note } >> #})

global = {
  \time 2/2
  \key c \major
  #(set-accidental-style 'modern)
}

upper = \relative c''' {
  \tempo "Adagio"
  \global
  \voiceOne
  \repeat volta 2 {
    g2.( <d f>4) |
    <d f>2( <c e>4) r |
    f8( e f g a g f e) |
    e2( d8 e \plusDown f fis) |
    
    g2.( <d f>4) |
    <d f>2( e) |
    <%{\tweak #'duration-log #1%} d f>16( g f \plusDown e f g a f) e4 d |
    <b d>2( c4) r |
  }
  \repeat volta 2 {
    g'2~ g8 \plusDown fis16 g \plusDown fis g a g |
    fis4( c'2 b4) |
    bes4.( c16 \plusDown bes a4 g) |
    fis8( g \plusDown a bes \plusDown b c \plusDown cis d) |
    d8( e16 \plusDown d c8 b) b( a) r g |
    g8( a16 \plusDown g fis8 e) e( d) r c |
    b8 g' \plusDown e a~a g4 fis8 |
    <fis a>2( g4) gis |
    a2~ a8 b \plusDown cis d |
    g,2~ g8 a \plusDown b c |
    fis,1 |
    <f d>4. \stemDown cis8 \stemUp d e \plusDown f fis |
    
    g2.( <d f>4) |
    <d f>2( <c e>4) r |
    f8( e f g a g f e) |
    e4( \plusDown d16 e f e d8 e \plusDown f fis) |
    
    g8 b16 \plusDown a c \plusDown b d \plusDown c <e, g>4 <d f> |
    <d f>2 <cis e> |
    <%{\tweak #'duration-log #1%} d f>16( g f \plusDown e f \plusDown g a f) e( f \plusDown fis g) g( f e d) |
    <d b>4.(^\markup \italic { 2nd time: rit. } e16 d c4) r |
    
  } 
  
}

middle = \relative c'' {
  \repeat volta 2 {
    \voiceTwo
    e2. s4 |
    s1 |
    d8 cis d e f e d c |
    c2 b4 r |
    
    e2. s4 |
    s2 c4 << cis \\ bes >> |
    a2 c4 b |
    f2( e4) r |
  }
  \repeat volta 2 {
    <c' e>2( <b d>) |
    <a c> << d \\ g, >> |
    <cis e>1 |
    d4 r r2 |
    <e g>4. <d fis>8 <c e>4 <b d> |
    <a c>4. <g b>8 <fis a>4 <dis fis> |
    \icc g4 s <b d> <a c> |
    c2( b4) r |
    r4 <cis g'>( <d fis>) r |
    r4 <b f'>( <c e>) r |
    << \new Voice { \voiceThree es2 \voiceOne d4 c }
      { c2 b4 a } >> |
    b4 r r2 |
    
    e2. s4 |
    s1 |
    d8 cis d e f e d c |
    c2 b4 r |
    e4 r s2 |
    s1 |
    a,2 c4 b |
    f2( e4) r |
  }
}

bass = \relative c' {
  \repeat volta 2 {
    c4 e g \showSwitch \toManual gis |
    a2.( g4) |
    \showSwitch \toPedal
    f4.( e8 d e f fis) |
    g2. r4 |
    
    c,4 e g \showSwitch \toManual gis |
    a2. \showSwitch \toPedal g4 |
    f2 g |
    c,2. r4 |
  }
  \repeat volta 2 {
    s1*6 |
    \toManual
    e4 \showSwitch \toPedal c d2 |
    g2. r4 |
    s1*2 |
    g1 |
    g4 r r2 |
    
    c,4 e g \showSwitch \toManual gis |
    a2.( g4) |
    \showSwitch \toPedal
    f4.( e8 d e f fis) |
    g2. r4 |
    
    \toPedal
    c,4 e g \showSwitch \toManual gis |
    a4( bes2 a8 g) |
    \showSwitch \toPedal
    f2 g |
    c,2. r4 |
    
    
  }
}

\score {
  \new GrandStaff <<
    \new Staff = "manual" <<
      \clef treble
      \mergeRestsOn
      \new Voice = "upper" \upper
      \new Voice = "middle" \middle
    >>
    \new Staff = "pedal" <<
      \mergeRestsOn
      \clef bass
      \new Voice = "bass" \bass
    >>
  >>
}
