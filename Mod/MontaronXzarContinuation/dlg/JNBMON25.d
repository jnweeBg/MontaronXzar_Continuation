/* ==========================================
========= ToB Banters and Conflicts =========
========================================== */

/*
 * Aerie - 1 (if SoA)
 * Nalia - 1 (if SoA)
 * Sarevok - 1
 * Keldorn - 1 (if GoodEnding > 0)
 * Cernd || Jaheira - 1 (Druidtalk)
 * Anomen, Knight - 1
 */

BEGIN JNBMON25

// Aerie if there was a previous conflict in SoA -> + 1 for good ending

CHAIN IF ~
	!Global("JNMONTAerieConflict","GLOBAL",0)
	InParty("Aerie")
	See("Aerie")
	!StateCheck("Aerie",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMON25Aerie1","GLOBAL",0)~
THEN JNBMON25 JNMON25Aerie1
	@0
	DO ~SetGlobal("JNMON25Aerie1","GLOBAL",1) IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
	== BAERIE25 @1
	== JNBMON25 @2
	== BAERIE25 @3
	= @4
	== JNBMON25 @5
	== BAERIE25 @6
	== JNBMON25 @7
	== BAERIE25 @8
EXIT

// Nalia if all banters in SoA happened 

CHAIN IF ~
	Global("JNMONTNaliaFriends","GLOBAL",1)
	InParty("Nalia")
	See("Nalia")
	!StateCheck("Nalia",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMON25Nalia1","GLOBAL",0)~
THEN BNALIA25 JNMON25Nalia1
	@9
	DO ~SetGlobal("JNMON25Nalia1","GLOBAL",1) IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
	== JNBMON25 @10
	== BNALIA25 @11
	= @12
	== JNBMON25 @13
	== BNALIA25 @14
	== JNBMON25 @15
	== BNALIA25 @16
	== JNBMON25 @17
EXIT

// Sarevok

CHAIN IF ~
	InParty("Sarevok")
	See("Sarevok")
	!StateCheck("Sarevok",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMON25Sarevok1","GLOBAL",0)~
THEN BSAREV25 JNMON25Sarevok1
	@18
	DO ~SetGlobal("JNMON25Sarevok1","GLOBAL",1)~
	== JNBMON25 @19
	== BSAREV25 @20
	== JNBMON25 @21
	== BSAREV25 @22
	== JNBMON25 @23
	== BSAREV25 @24
EXIT

// Keldorn (only get a talk if there is some good in Monty already)

CHAIN IF ~
	OR(2)
	Global("JNMONTNaliaFriends","GLOBAL",1)
	!Global("JNMONTGoodEnding","GLOBAL",0)
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMON25Keldorn1","GLOBAL",0)~
THEN BKELDO25 JNMON25Keldorn1
	@25
	DO ~SetGlobal("JNMON25Keldorn1","GLOBAL",1)~
	== JNBMON25 @26
	== BKELDO25 @27
	== JNBMON25 @28
EXIT

// Cernd Druidtalk

CHAIN IF ~
	Global("JNMONTDruidTalk","GLOBAL",0)
	!Global("JNMONTGoodEnding","GLOBAL",0)
	InParty("Cernd")
	See("Cernd")
	!StateCheck("Cernd",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMON25Cernd1","GLOBAL",0)~
THEN JNBMON25 JNMON25Cernd1
	@29
	DO ~SetGlobal("JNMON25Cernd1","GLOBAL",1) SetGlobal("JNMONTDruidTalk","GLOBAL",1) IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
	== BCERND25 @30
	== JNBMON25 @31
	== BCERND25 @32
	== JNBMON25 @33
	== BCERND25 @34
	= @35
	== JNBMON25 @36
	== BCERND25 @37
	== JNBMON25 @38
	== BCERND25 @39
	== JNBMON25 @40
	== BCERND25 @41
EXIT

// Jaheira Druidtalk

CHAIN IF ~
	Global("JNMONTDruidTalk","GLOBAL",0)
	!Global("JNMONTGoodEnding","GLOBAL",0)
	InParty("Jaheira")
	See("Jaheira")
	!StateCheck("Jaheira",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMON25Jaheira1","GLOBAL",0)~
THEN JNBMON25 JNMON25Jaheira1
	@42
	DO ~SetGlobal("JNMON25Jaheira1","GLOBAL",1) SetGlobal("JNMONTDruidTalk","GLOBAL",1) IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
	== BJAHEI25 @43
  == JNBMON25 @44
  = @45
  == BJAHEI25 @46
  == JNBMON25 @47
  == BJAHEI25 @48
  = @49
  = @50
  = @51
  == JNBMON25 @52
  == BJAHEI25 @53
  == JNBMON25 @54
  == BJAHEI25 @55
EXIT

// Anomen Knight talk

CHAIN IF ~
	InParty("Anomen")
	See("Anomen")
	!StateCheck("Anomen",CD_STATE_NOTVALID)
	!StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	CombatCounter(0)
  Global("AnomenIsKnight","GLOBAL",1)
	Global("JNMON25Anomen1","GLOBAL",0)~
THEN JNBMON25 JNMON25Anomen1
	@56
	DO ~SetGlobal("JNMON25Anomen1","GLOBAL",1)~
  == BIMOEN25 IF ~InParty("Imoen2") InMyArea("Imoen2") !Statecheck("Imoen2",CD_STATE_NOTVALID)~ THEN @57
  == BANOME25 @58
  == JNBMON25 @59
  == BANOME25 @60
EXIT
