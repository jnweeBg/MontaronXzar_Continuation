// Kickout dialogues
// (appended to BDXZAR, which already exists in SoD and is set onto Xzar when he is kicked)
// BDXZARJ is for the in Party Dialogue

// Kicked out in Avernus
CHAIN IF ~OR(5)
	AreaCheck("bd4400")
	AreaCheck("bd4500")
	AreaCheck("bd4600")
	AreaCheck("bd4601")
	AreaCheck("bd4700")
	GlobalLT("bd_plot","global",570)~
THEN BDXZAR xk1
	@0 /* What a curious place. Fight on without me, I will take a look at this place myself. */
	DO ~SetGlobal("JNXZAR_kicked_bd4700","global",1) SetGlobal("bd_joined","locals",0)~
	== BDMONTAJ IF ~IsValidForPartyDialog("Montaron")~ THEN @1 /* Ye'll be the death o' me, wizard. Ye better not make us wait for long, <CHARNAME>. */
	DO ~SetGlobal("JNMONT_kicked_bd4700","global",1)
	SetGlobal("bd_joined","locals",0)
	ChangeAIScript("bdparty",DEFAULT)
	JumpToObject("Xzar")
	LeaveParty()~
EXIT

// Kicked out anywhere, except Avernus or Korlasz's crypt
CHAIN IF ~GlobalGT("bd_joined","locals",0)~ THEN BDXZAR xk2
  @2 /* You... you're letting me go? But we have shared so much... so many good times... This is truly a sad day indeed. */
END
+ ~	GlobalGT("bd_npc_camp_chapter","global",1)
	GlobalLT("bd_npc_camp_chapter","global",5)
	OR(2)
	!Range("ff_camp",999)
	NextTriggerObject("ff_camp")
    !IsOverMe("Xzar")~
+ @3 EXTERN BDXZAR xk2.1 /* Please wait for me in the camp. */
++ @6 EXTERN BDXZAR xk2.2 /* Remain here and await my return. */
++ @8 EXTERN BDXZAR xk2.3 /* No, I need you to stay with the group. */

CHAIN BDXZAR xk2.1
	@4 /* Wait so you come back when you need me? Oh joyous day, you will, you will! */
	DO ~SetGlobal("bd_npc_camp","locals",1) SetGlobal("bd_joined","locals",0)~
	== BDXZAR IF ~InParty("Montaron")~ THEN @5 /* Come along Montaron. You are my counterpart and we shall not be separated. */
	DO ~ActionOverride("Montaron",SetGlobal("bd_joined","locals",0))
		ActionOverride("Montaron",SetGlobal("bd_npc_camp","locals",1))
		ActionOverride("Montaron",ChangeAIScript("bdparty",DEFAULT))
		ActionOverride("Montaron",LeaveParty())~
EXIT

CHAIN BDXZAR xk2.2
	@7 /* If you think it is wise, then I will wait right here, yes I will. */
	DO ~SetGlobal("bd_joined","locals",0)~
	== BDXZAR IF ~InParty("Montaron")~ THEN @5 /* Come along Montaron. You are my counterpart and we shall not be separated. */
	DO ~ActionOverride("Montaron",SetGlobal("bd_joined","locals",0))
		ActionOverride("Montaron",ChangeAIScript("bdparty",DEFAULT))
		ActionOverride("Montaron",JumpToObject("Xzar"))
		ActionOverride("Montaron",LeaveParty())~
EXIT

CHAIN BDXZAR xk2.3
	@9 /* I knew you wouldn't leave me, no you wouldn't. Oh, I will bring death upon your enemies! */
	DO ~JoinParty()~
EXIT

// Join the party again Dialogue with Montaron
CHAIN IF ~Global("bd_joined","locals",0)
	!InPartyAllowDead("Montaron")
	!Dead("Montaron")
	Range("Montaron",30)~ THEN BDXZAR xk3
	@10 /* You're here! We will destroy your enemies! Yes? */
END
++ @11 DO ~ActionOverride("Montaron",JoinParty()) JoinParty()~ EXIT /* Yes. */
++ @12 EXIT /* Ermm.. no, please stay here. */

// Join the party again Dialogue
CHAIN IF ~Global("bd_joined","locals",0)
	OR(3)
	InPartyAllowDead("Montaron")
	Dead("Montaron")
	!Range("Montaron",30)~ THEN BDXZAR xk4
	@10 /* You're here! I will destroy your enemies! Yes? */
END
++ @11 DO ~JoinParty()~ EXIT /* Yes. */
++ @12 EXIT /* Ermm.. no, please stay here. */
