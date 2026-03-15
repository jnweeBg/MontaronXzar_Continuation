// Thrixx game (far done)

ADD_TRANS_TRIGGER BDTHRIX 13 ~!IsValidForPartyDialogue("Xzar") !IsValidForPartyDialogue("Montaron")~ DO 2 IF ~!Is?f?ValidForPartyDialogue("Rasaad")~

/* Thrix' game: add Biff for certain randomness to the blocks of 4 dialogue states each */
/* 1st states of 4 state blocks: add Biff to the end */
EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("JNMONT_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("Montaron")~ THEN + xxBiff_thrix
END
/* 2nd states of 4 state blocks: add Biff at the top, i.e. position "1" as "0" is in case there is no more NPC available */
EXTEND_TOP BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("JNMONT_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("Montaron")~ THEN + xxBiff_thrix
END
/* 3rd states of 4 state blocks: add Biff at position 10 */
EXTEND_TOP BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("xxBiff_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("xxBiff")~ THEN + xxBiff_thrix
END
/* 4th states of 4 state blocks: add Biff at position 5 */
EXTEND_TOP BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("xxBiff_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("xxBiff")~ THEN + xxBiff_thrix
END

/* in case PC lost and Biff was chosen: Thrix claims him (only verbally) */
EXTEND_BOTTOM BDTHRIX 118 119 120 121 
IF ~Global("xxBiff_SoDThrix","GLOBAL",2) IsValidForPartyDialogue("xxBiff")~ THEN + xxBiff_chosen
END

/* Thrix new dialogue for our NPC */
APPEND BDTHRIX

IF ~~ THEN BEGIN xxBiff_thrix
  SAY ~The Understudy... always so well prepared. I will take his soul and show him that he is not prepared, at all.~
  IF ~~ THEN REPLY ~You want Biff? Then he will be yours if I lose.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",1)
SetGlobal("bd_thrix_sacrifice_companion","global",1)
~ EXTERN xxBiffJ thrix_01

  IF ~RandomNum(4,1)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 70
  IF ~RandomNum(4,2)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 71
  IF ~RandomNum(4,3)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 72
  IF ~RandomNum(4,4)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 73

  IF ~!Global("BD_NumInParty","bd4500",1)
!Global("BD_NumInParty","bd4500",2)
!Global("BD_NumInParty","bd4500",3)
!Global("BD_NumInParty","bd4500",4)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2)~ + 114

  IF ~~ THEN REPLY ~He has his faults, but I'll not risk Biff's soul in so blithe a fashion. If I cannot answer your riddle, mine is the soul you will take. Agreed?~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",3)~ GOTO 113
  IF ~~ THEN REPLY ~I'll feed you your own limbs if you don't let me into the tower, you wretched creature. I'm done playing games with you.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",5)~ GOTO 12
END

IF ~~ THEN xxBiff_chosen
SAY ~Thrix has marked your soul, Understudy. Your soul is mine!~ 
++ ~Whoops. Sorry, Biff.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",4)~ EXTERN xxBiffJ thrix_02
++ ~No, you will not take his soul, devil. We will fight you!~ GOTO 10
END

END //APPEND

/* Biff's reactions in Thrix' dialogue */
APPEND xxBiffJ

IF ~~ THEN thrix_01
SAY ~(gulp) I don't like where this is going.~
IF ~~ THEN EXTERN ~BDTHRIX~ 116
END

IF ~~ THEN thrix_02
  SAY ~(Fortunately I know that he never really comes to claim the soul, you know.)~
  IF ~~ THEN DO ~SetGlobal("bd_thrix_won","global",1) //this is for an achievement
  ~ EXTERN ~BDTHRIX~ 140
END 

END //APPEND