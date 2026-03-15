// PC can ask about Montaron and Xzar in the last meeting with Imoen
EXTEND_BOTTOM bdimoen 104 // not guilty
  + ~Global("JNMONT_SoDparty_epilogue","GLOBAL",2)~ + @1 + jnmont_sod /* Where are Montaron and Xzar? */
END
EXTEND_BOTTOM bdimoen 109 // guilty
  + ~Global("JNMONT_SoDparty_epilogue","GLOBAL",2)~ + @1 + jnmont_sod /* Where are Montaron and Xzar? */
END

APPEND bdimoen

IF ~~ THEN jnmont_sod
  SAY @2 /* What do you care about those two? They left the city just hours after your imprisonment — some friends they are. */
  IF ~~ THEN GOTO 119
END
