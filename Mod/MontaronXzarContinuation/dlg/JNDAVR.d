BEGIN JNDAVR

CHAIN IF ~NumTimesTalkedTo(0)~ THEN JNDAVR t
	@0
	== JNDAVR @1
	= @2
END
+ ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ + @3 EXTERN JNDAVR t.1
+ ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ + @4 EXTERN JNDAVR t.1
+ ~OR(3) !InParty("%jnmontdv%") !InMyArea("%jnmontdv%") StateCheck("%jnmontdv%","CD_STATE_NOTVALID")~ + @3 EXTERN JNDAVR t.2
+ ~OR(3) !InParty("%jnmontdv%") !InMyArea("%jnmontdv%") StateCheck("%jnmontdv%","CD_STATE_NOTVALID")~ + @4 EXTERN JNDAVR t.2

CHAIN JNDAVR t.1
	@5
	== JNDAVR @6
	== JNMONTJ @7
	== JNDAVR @8
	== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @14
	== JNMONTJ @9
	== JNDAVR @10
	DO ~Enemy()~
EXIT

CHAIN JNDAVR t.2
	@5
	== JNDAVR @6
	= @11
	= @12
	== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @14
	== JNDAVR @13
	DO ~Enemy()~
EXIT
