// Kickout dialogues
// (appended to BDMONTAR, which already exists in SoD and is set onto Montaron when he is kicked)
// BDMONTAJ is for the in Party dialogue

// Kicked out in Avernus
CHAIN IF ~OR(5)
	AreaCheck("bd4400")
	AreaCheck("bd4500")
	AreaCheck("bd4600")
	AreaCheck("bd4601")
	AreaCheck("bd4700")
	GlobalLT("bd_plot","global",570)~
THEN BDMONTAR xk1
	@0 /* If ye think ye'll live down 'ere without me, I'll be waitin' right here, till ye come back, fool. */
	DO ~SetGlobal("JNMONT_kicked_bd4700","global",1) SetGlobal("bd_joined","locals",0)~
	== BDMONTAR IF ~IsValidForPartyDialog("Xzar")~ THEN @1 /* Ye stay 'ere wizard, I'll no be stuck in this place alone, if <CHARNAME> decides to leave. */
	DO ~SetGlobal("JNXZAR_kicked_bd4700","global",1)
	SetGlobal("bd_joined","locals",0)
	ChangeAIScript("bdparty",DEFAULT)
	JumpToObject("Montaron")
	LeaveParty()~
EXIT

// Kicked out anywhere, except Avernus or Korlasz's crypt
CHAIN IF ~GlobalGT("bd_joined","locals",0)~ THEN BDMONTAR xk2
  @2 /* Ye have no need of my skills anymore? */
END
+ ~	GlobalGT("bd_npc_camp_chapter","global",1)
	GlobalLT("bd_npc_camp_chapter","global",5)
	OR(2)
	!Range("ff_camp",999)
	NextTriggerObject("ff_camp")
    !IsOverMe("Montaron")~
+ @3 EXTERN BDMONTAR xk2.1 /* Please wait for me in the camp. */
++ @6 EXTERN BDMONTAR xk2.2 /* Remain here and await my return. */
++ @7 EXTERN BDMONTAR xk2.3 /* No, I need you to stay with the group. */

CHAIN BDMONTAR xk2.1
	@4 /* Ye better not have me wait for too long. */
	DO ~SetGlobal("bd_npc_camp","locals",1) SetGlobal("bd_joined","locals",0)~
	== BDMONTAR IF ~InParty("Xzar")~ THEN @5 /* Come wizard, we are inseparable until the day ye die. */
	DO ~ActionOverride("Xzar",SetGlobal("bd_joined","locals",0))
		ActionOverride("Xzar",SetGlobal("bd_npc_camp","locals",1))
		ActionOverride("Xzar",ChangeAIScript("bdparty",DEFAULT))
		ActionOverride("Xzar",LeaveParty())~
EXIT

CHAIN BDMONTAR xk2.2
	@4 /* Ye better not have me wait for too long. */
	DO ~SetGlobal("bd_joined","locals",0)~
	== BDMONTAR IF ~InParty("Xzar")~ THEN @5 /* Come wizard, we are inseparable until the day ye die. */
	DO ~ActionOverride("Xzar",SetGlobal("bd_joined","locals",0))
		ActionOverride("Xzar",ChangeAIScript("bdparty",DEFAULT))
		ActionOverride("Xzar",JumpToObject("Montaron"))
		ActionOverride("Xzar",LeaveParty())~
EXIT

CHAIN BDMONTAR xk2.3
	@8 /* A wise choice. */
	DO ~JoinParty()~
EXIT

// Join the party again Dialogue with Xzar
CHAIN IF ~Global("bd_joined","locals",0)
	!InPartyAllowDead("Xzar")
	!Dead("Xzar")
	Range("Xzar",30)~ THEN BDMONTAR xk3
	@9 /* Ye want us for a piece of the action? */
END
++ @10 DO ~ActionOverride("Xzar",JoinParty()) JoinParty()~ EXIT /* I do, please join me. */
++ @11 EXTERN BDMONTAR xk3.1 /* Not right now, please stay here. */

CHAIN BDMONTAR xk3.1
	@12 /* Then why do ye bother me! */
EXIT

// Join the party again Dialogue
CHAIN IF ~Global("bd_joined","locals",0)
	OR(3)
	InPartyAllowDead("Xzar")
	Dead("Xzar")
	!Range("Xzar",30)~ THEN BDMONTAR xk4
	@13 /* Ye have need of my skills? */
END
++ @10 DO ~JoinParty()~ EXIT /* I do, please join me. */
++ @11 EXTERN BDMONTAR xk3.1 /* Not right now, please stay here. */
