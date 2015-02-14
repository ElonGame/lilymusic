\version "2.18.0"

% ignore collisions
oops = \once \override Staff.NoteColumn #'ignore-collision = ##t

% script around slur
sas = \once \override Script #'avoid-slur = #'around

tempoMark = #(define-music-function (parser location text) (string?)
  #{
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \once \override Score.RehearsalMark #'break-align-symbols = #'(time-signature key-signature)
    \once \override Staff.TimeSignature #'break-align-anchor-alignment = #LEFT
    \mark \markup \bold { $text }
  #})

rh = { \change Staff = "rh" \stemDown }
lh = { \change Staff = "lh" \stemUp }
lhd = { \change Staff = "lh" \stemDown }


% we place this after layout has been determined,
% because LilyPond has no real footnote support.
nbMarkup = \markup \fontsize #2 \bold NB.

tenutoFootnote = \markup {
  \nbMarkup
  Alle Töne des gebrochenen Accordes,
  soweit es die Applicatur erlaubt,
  bleiben liegen.
}
