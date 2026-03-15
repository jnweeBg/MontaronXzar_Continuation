BEGIN JNMON25P

// Kickout dialogue

IF ~Global("JNMONTToBKickedOut","GLOBAL",0)~ b1
SAY @0
++ @1 DO ~JoinParty()~ EXIT
+ ~AreaCheck("AR4500")~ + @2 DO ~SetGlobal("JNMONTToBKickedOut","GLOBAL",1) MoveToPointNoInterrupt([1777.1109]) Face(14)~ EXIT
+ ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + @2 DO ~SetGlobal("JNMONTToBKickedOut","GLOBAL",1)~ EXIT
+ ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + @3 DO ~SetGlobal("JNMONTToBKickedOut","GLOBAL",1)
CreateVisualEffectObject("spdimndr",Myself)
Wait(2)
MoveBetweenAreas("AR4500",[1777.1109],14)~ EXIT
END

// Rerecruit dialogue

IF ~Global("JNMONTToBKickedOut","GLOBAL",1)~ b2
SAY @4
++ @5 + b2.1
++ @6 + b2.2
END

IF ~~ b2.1
SAY @7
IF ~~ DO ~SetGlobal("JNMONTToBKickedOut","GLOBAL",0) JoinParty()~ EXIT
END

IF ~~ b2.2
SAY @8
IF ~~ EXIT
END
