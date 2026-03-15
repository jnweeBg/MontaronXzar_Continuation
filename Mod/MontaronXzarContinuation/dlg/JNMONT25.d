BEGIN JNMONT25

IF ~Global("JNMONTSummoned","GLOBAL",2)~ t2
SAY @9
++ @10 + t1.1
++ @11 + t2.2
END

IF ~~ t2.2
SAY @12
IF ~~ EXIT
END


IF ~Global("JNMONTSummoned","GLOBAL",1)~ t1
SAY @0
++ @1 DO ~SetGlobal("JNMONTSummoned","GLOBAL",2)~ + t1.
++ @2 DO ~SetGlobal("JNMONTSummoned","GLOBAL",2)~ + t1.
END

IF ~~ t1.
SAY @3
= @4
++ @5 + t1.1
++ @6 + t1.2
END

IF ~~ t1.1
SAY @7
IF ~~ DO ~JoinParty()~ EXIT
END

IF ~~ t1.2
SAY @8
IF ~~ DO ~MoveToPointNoInterrupt([1777.1109]) Face(14)~ EXIT
END
