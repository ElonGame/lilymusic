\version "2.12.0"

\include "definitions.ly"

global = { \key c \major }

adagioMusic = {
  % bar ?? - ??
  <<
    \context Staff = "rh" \context Voice = "rh" \relative c' {
      \global
      \tempoMark #"Adagio."
      r4 f^(
      _\markup \whiteout { M. III. Salicional und Gedackt 8'. }
      e4. \lh \voiceOne b8 |
      <a d>4. gis8 <f~ gis~>4 <f gis c>( |
      <e a> <e gis> <e g> <d fis> |
      f e8 dis b'4. a8 |
      a4 gis2) 
      \rh \oneVoice r4 |
      r a e'4. ais,8~ |
      ais4 b2 r4 |
      r4 <<
        {
          c( g'4. dis8~ |
          dis4 e fis g |
          b4. a8 g4 fis) |
        }
        \\ {
          c4~ c b~ |
          b c2 b4 |
          <d g> <c fis> b2 |
        }
      >>
    }
    \context Staff = "lh" \context Voice = "lh" \relative c {
      \global
      r2 r4 r8 <<
        {
          \voiceTwo
          <e gis>8( |
          d4 c <b d~> <e, d'> |
          <a c> <e b'> <c c'> <d a'> |
          f fis <b~ dis>2 |
          <e, b'>2.)
        }
        \new Voice {
          \voiceThree
          s8 | s1*2 |
          c'2 fis |
          e2.
        }
        \new Voice {
          \voiceFour
          s8 |
          f2 s |
          s1 |
          a,2
        }
      >>
      \oneVoice
      r4 |
      r4 e'8( fis g4 fis8 e~ |
      e4 dis2) r4 |
      r4 \voiceTwo e( f2~ |
      << { f4 e } \new Voice { \voiceOne g2 } >> \oneVoice c,4 d |
      d2. dis4)
    }
    \context Staff = "ped" \context Voice = "ped" \relative c {
      \global
      R1*4 |
      r2 r4 dis(^\pp
      _\markup { Subbass 16. }
      d cis c2 |
      b2.) ais4( |
      a2 g |
      c4. b8 a4 g |
      d2 g4 b) |
    }
  >>
  % bar ?? - ??
  <<
    \context Staff = "rh" \context Voice = "rh" \relative c'' {
      a4\p(
      ^\markup { M. II. \italic hervortretend }
      ^\markup { Oboe oder Geigenprinzipal }
      e' d4. b8 |
      g4 a2 b4~ |
      b) e\< fis4. g8 |
      \time 2/4
      a4.\> e8 |
      \time 4/4
      fis2\!
      r4
      ^\markup { M. III. }
      \clef bass 
      <<
        {
          b,,4~_\ppp |
          b a8 e g4 fis~ |
          fis c'(~  c bes8 f |
          as4 g2) as4 |
          \clef treble
          es'2( f4 <g des'~> |
          des' c bes as8 g |
          f2._\> g8 as)\! |
        }
        \\ {
          s4 |
          e,2( es4.\> d8 |
          c4)\! ges'(\> f2 |
          fes4. es8)\! des4 d |
          des'1~ |
          <des g>2. f8( es~ |
          es4 d c d) |
        }
        \\ {
          % this voice just draws the tie in measure 251-252
          \override NoteColumn #'ignore-collision = ##t
          s4 |
          s1*3 |
          s2. \voiceOne g4_~ |
          \voiceTwo g2.
        }
      >>
      \once \override Slur #'positions = #'(2.5 . 1)
      as4(\p
      ^\markup { M. II. }
      ^\markup { Oboe oder Geigenprinzipal (Aeoline 16'.) }
      es' des4. bes8 |
      ges4 as2 bes4)~ |
      bes\< es( f ges |
      bes,\> as8 ges des'2)\pp
    }
    \context Staff = "lh" <<
      \context Voice = "lh" \relative c' {
        \voiceOne
        e2( d |
        e4 fis2 f4) |
        e2. dis4 |
        \time 2/4
        <c~ e> <a c> |
        \time 4/4
        <ais cis>2 d,4\rest^\ppp g,(~ |
        g2~ g4 a~ |
        a2 as~ |
        as4 bes~ bes2) |
        \oneVoice
        as'4(
        _\markup \whiteout \italic { molto cresc. }
        g f g |
        e!2.) \voiceOne c'4 |
        s1 |
        es2( des |
        es4 f2 fes4) |
        \once \override Slur #'positions = #'(4 . 4)
        es2( d4 des |
        \clef treble ges es as2) |
      }
      \new Voice \relative c {
        \voiceTwo
        e2(
        _\markup { M. III. \dynamic pp }
        fis4 g |
        b c2 b4)^~ |
        <gis b>(\< a8 g <fis ais>4 b |
        \time 2/4
        a\> g |
        \time 4/4
        fis2)\! d,( |
        cis) c4. d8 |
        es2. d4 |
        des4. es8 fes4 f |
        s1 |
        s2. f'8( g |
        \oneVoice
        as2.
        _\markup \whiteout \italic dimin.
        d,4) |
        \voiceTwo
        es2(
        _\markup { M. III. \dynamic p }
        f4 ges |
        bes ces2 bes4) |
        g as8 ges <f as>4 ges |
        bes c ges'\pp f
      }
      \new Voice \relative c' {
        \voiceThree
        a4\rest a2 g4 |
        s1 |
        s4 a s2 |
        s2 |
        s1*7 |
        as2. ges4 |
        s2.
        \voiceTwo
        \once \override NoteColumn #'ignore-collision = ##t
        bes4^~ |
        \voiceThree
        bes4 as
      }
      \new Voice \relative c' {
        % this voice just draws some ties
        \override NoteColumn #'ignore-collision = ##t
        \hideNotes
        s1*3 |
        \stemDown a4_~ \stemUp a
        s1*9 |
        s4 \voiceOne as~ \voiceTwo as 
      }
    >>
    \context Staff = "ped" \context Voice = "ped" \relative c {
      c2.( b4 |
      e4. es8 d4 g,) |
      c2.( b4 |
      \time 2/4
      a g |
      \time 4/4
      fis^\> e d)\! r |
      R1*3 |
      es1(^\< |
      << 
        {
          as\! |
          bes) |
        }
        {
          s2. s4^\> | % draw the hairpin like the 1871 score
          s2 s\!
        }
      >>
      ces2.(\pp bes4 |
      es4. d8 des4 ges,) |
      ces2._( bes4 |
      es as des,) r |
    }
  >>
  % bar ?? - ??
  <<
    \context Staff = "rh" <<
      \context Voice = "rh" \relative c''' {
        \oneVoice r4
        ^\markup { M. III. Harmonika 8' allein }
        \voiceOne
        cis2(_\ppp b8 ais~ |
        ais4 b8 cis dis4. e8)~ |
        e dis4 d8 cis4 gis8 ais |
        b4 ais8 eis fis4 eis8 dis |
        gis2
        \oneVoice
        r4
        \clef bass
        b,,\mf
        ^\markup { M. I. }
        \voiceOne
        bes1~_\markup \whiteout { \italic düster 16' 8' u. 4'. } |
        bes4 ces8 des es4 fes |
        \clef treble
        as( g8 as bes4 ces8 des) |
        es1~ |
        es2~ es4. f8 |
        ges4 \oneVoice r r2 |
        
        
      }
      \new Voice \relative c''' {
        \voiceTwo
        s4 gis fisis2( |
        gis4 fisis\< fis fisis |
        gis\! a gis)\> cis, |
        fis eis8\! r r4 bis~ |
        bis cis s2 |
        r4 a, as2~ |
        as4 g2 as8 bes |
        <ces fes>4( <bes es> <des as'> <fes as>) |
        es1~ |
        es2~ es4. f8 |
        ges4
      }
      \new Voice \relative c'' {
        \voiceThree
        s1*8 |
        as4_( g ges g)~ |
        g as2
        \voiceFour
        \once \override Tie #'staff-position = #0.5
        ces4~ |
        \voiceTwo \oops ces
      }
      \new Voice \relative c'' {
        % just draw some ties
        \override NoteColumn #'ignore-collision = ##t
        s1*3 |
        s2. s8 \stemUp dis4*1/2^~ |
        \stemDown dis
      }
    >>
    \context Staff = "lh" <<
      \context Voice = "lh" \relative c'' {
        \voiceOne
        r4 gis( ais b8 cis |
        cisis4 dis4~ dis cis) |
        b bis cis gis |
        fis8( gis ais2 gis8 fis~ |
        fis4 eis)
      }
      \new Voice \relative c' {
        \voiceTwo
        e1~ |
        e4 dis b' ais |
        gis fis eis2 |
        dis4( cisis dis gis |
        cis,2)
      }
    >>
    \context Staff = "ped" \context Voice = "ped" \relative c {
      R1*5 |
      r4 es2(
      _\markup { Posaune 16'. }
      _\markup \italic hervortretend.
      d8. bes16 |
      des4 g,2 as4) |
      fes'_( es8. bes16 des4 as'~ |
      as g8. es16 ges4 g8 des'~ |
      des4 c ces as |
      d1~)_\>_\markup { Posaune fort. } |
      d2. as4\pp |
      d1~\> |
      d2. as4 |
      d1~_\ppp_\markup { Subbass allein } |
      \repeat unfold 5 d1~ |
      d2. r4 |
      
      
    }
  >>
  
}

%%master: psalm94.ly

