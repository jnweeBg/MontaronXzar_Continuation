BEGIN JNMON9

CHAIN IF ~GlobalLT("JNMONTSodTalk","GLOBAL",2) !Dead("Xzar") Range("Xzar",30)~ THEN JNMON9 sodm1
	@0 /* What is yer business here, <CHARNAME>? Talk to the loonie, he'll want to talk to ye. */
	DO ~SetGlobal("JNMONTSodTalk","GLOBAL",2)~
EXIT

CHAIN IF ~Global("JNMONTSodTalk","GLOBAL",2) !Dead("Xzar") Range("Xzar",30)~ THEN JNMON9 sodm2
	@1 /* I told ye to talk to Xzar, if ye want something. */
EXIT

// If Xzar dies before both are recruited, Montaron leaves
CHAIN IF ~OR(2) Dead("Xzar") !Range("Xzar",30)~ THEN JNMON9 sodm3
	@2 /* I've no time for ye. The mad wizard's gone and if I no get him back quick, I'll be in trouble. Out o' me way. */
	DO ~EscapeArea()~
EXIT
