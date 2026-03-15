EXTEND_TOP FATESP 6 #14
+ ~Global("JNMONTSummoned","GLOBAL",0) OR(3) !Global("JNMONTResurrected","GLOBAL",1) Dead("%jnmontdv%") !BeenInParty("%jnmontdv%")~ + @0 /* Bring me Montaron, the fighter/thief. */
DO ~SetGlobal("JNMONTSummoned","GLOBAL",2)~
GOTO 10
+ ~!Dead("%jnmontdv%") Global("JNMONTSummoned","GLOBAL",0) Global("JNMONTResurrected","GLOBAL",1) BeenInParty("%jnmontdv%")~ + @0
DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
Wait(2)
MoveGlobal("ar4500","%jnmontdv%",[1999.1228])
ActionOverride("%jnmontdv%",Face(0))
ActionOverride("%jnmontdv%",ChangeAIScript("",CLASS))
ActionOverride("%jnmontdv%",ChangeAIScript("",RACE))
ActionOverride("%jnmontdv%",ChangeAIScript("",GENERAL))
ActionOverride("%jnmontdv%",ChangeAIScript("",DEFAULT))
ActionOverride("%jnmontdv%",ChangeAIScript("JNMON25S",OVERRIDE))
ActionOverride("%jnmontdv%",SetDialog("JNMONT25"))
SetGlobal("JNMONTSummoned","GLOBAL",1)~ GOTO 8
END
