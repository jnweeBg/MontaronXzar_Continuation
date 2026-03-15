EXTEND_TOP FATESP 6 #14
+ ~Global("JNMONTSummoned","GLOBAL",0) OR(3) !Global("JNMONTResurrected","GLOBAL",1) Dead("%jnmontdv%") !BeenInParty("%jnmontdv%")~ + @0 /* Bring me Montaron, the fighter/thief. */
DO ~SetGlobal("JNMONTSummoned","GLOBAL",2)~
GOTO 10
+ ~!Dead("%jnmontdv%") Global("JNMONTSummoned","GLOBAL",0) Global("JNMONTResurrected","GLOBAL",1) BeenInParty("%jnmontdv%")~ + @0
DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
Wait(2)
CreateCreature("JNMON25",[1999.1228],0) 
SetGlobal("JNMONTSummoned","GLOBAL",1)~ GOTO 8
END
