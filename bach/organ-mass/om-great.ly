\version "2.11"
\include "setup.ly"
#(set-global-staff-size 16)
\header { subtitle = "key: great chorals" }
\include "01-kyrie-gott-vater.ly" 	\score { \transpose e g \fourStaffs }
\include "02-christe-aller-welt.ly" \score { \transpose e g \fourStaffs }
\include "03-kyrie-gott-heiliger.ly" \score { \transpose e g \fourStaffs }
\include "04-allein-gott.ly" \score { \transpose f g \fourStaffsTwoLyrics }
\include "05-dies-sind.ly" \score { \fourStaffsTwoLyrics }
\include "06-wir-glauben.ly" \score { \transpose e d \fourStaffs }
\include "07-vater-unser.ly" \score { \transpose d e \fourStaffsTwoLyrics }
\include "08-christ-unser-herr.ly" \score { \transpose d c \fourStaffs }
\include "09-aus-tiefer-not.ly" \score { \transpose fis e \fourStaffsTwoLyrics }
\include "10-jesus-christus.ly" \score { \transpose f d \fourStaffs }
