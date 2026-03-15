BEGIN JNXZA9

CHAIN IF ~!Dead("Montaron") Range("Montaron",30) Global("JNMONTSodTalk","GLOBAL",3)~ THEN JNXZA9 sodx1
	@2 /* Must you complain so much Montaron. How could I have known that the inn was burned down. */
	DO ~SetGlobal("JNMONTSodTalk","GLOBAL",4)~
	== JNMON9 @3 /* If ye don't find us somewhere to sleep soon, I'll find ye a hole in the dirt. */
	== JNXZA9 @4 /* And what then dear Montaron? I am the only one that knows our mission. */
	== JNMON9 @5 /* What mission, ye fool! We've been walking through the forest for days now, because of yer so called mission! */
	== JNXZA9 @6 /* Now don't get so angry again, Montaron. You will see it in the end.. and look who's here! */
END
+ ~~ + @7 EXTERN JNXZA9 sodx1.

CHAIN JNXZA9 sodx1.
	@8 /* How nice of you to ask. Someone dear to us asked for help with an endeavor of his, so now we are traveling the roads once again. */
	== JNMON9 @9 /* Shut yer trap, blasted mage! Our mission be long over, but ye dreamt of riches to be found, so 'ere we are. */
END
+ ~~ + @10 EXTERN JNXZA9 sodx1.1 /* Riches? There is plenty of that on my travels. */
+ ~~ + @11 EXTERN JNXZA9 sodx1.2 /* I see. Well good luck, but I better be on my way. */

CHAIN JNXZA9 sodx1.1
	@12 /* Oh? Are you saying we should travel with you? What a splendid idea. But first tell me — where are you headed? */
END
+ ~~ + @13 EXTERN JNXZA9 sodx1.1. /* Caelar Argent has tried to kill me, so I would like to return the favor. */
+ ~~ + @14 EXTERN JNXZA9 sodx1.1. /* I need to find out what this crusade is about and what the Shining Lady's goals are. */

CHAIN JNXZA9 sodx1.1.
	@15 /* It sounds like you need some help. Well aren't you lucky to run into dear Montaron and me. */
	== JNMON9 @16 /* Ye can't just do what ye please, wizard! We've to report back. */
	== JNXZA9 @17 /* Oh don't listen to Montaron. He's just a bit moody. */
END
+ ~~ + @18 EXTERN JNXZA9 sodx1.1.1 /* Your help would be most welcome. */
+ ~~ + @19 EXTERN JNMON9 sodx1.1.2 /* I don't need you right now, but you can stay in my camp. */
+ ~~ + @20 EXTERN JNXZA9 sodx1.1.3 /* Thank you for the offer, but I have all the help I need. Good luck on your travels. */
+ ~~ + @21 EXTERN JNXZA9 sodx1.1.3 /* Only a madman would travel with you two. Stay away from me. */

CHAIN JNXZA9 sodx1.1.1
	@22 /* Very good. Very good, indeed. Let us make haste into your next battle! */
	DO ~SetGlobal("JNMONTSodRecruited","GLOBAL",1)
	ActionOverride("Montaron",JoinParty())
	JoinParty()~
EXIT

CHAIN JNMON9 sodx1.1.2
	@23 /* I'll no be ordered around like yer servant! */
	== JNXZA9 @24 /* Now what dear Montaron means to say is — We will gladly take a look at your camp and not sleep in the forest again. */
	== JNMON9 @25 /* *Hrmpf* */
	DO ~ActionOverride("Xzar",EscapeAreaMove("BD1000",403,3118,S))
	ActionOverride("Xzar",SetDialog("BDXZAR"))
	SetGlobal("JNMONTSodRecruited","GLOBAL",1)
	EscapeAreaMove("BD1000",350,3100,SSE)
	SetDialog("BDMONTAR")~
EXIT

CHAIN JNXZA9 sodx1.1.3
	@26 /* I would have thought you wiser, than to decline honest help. Come on Montaron, we'll find you a place to sleep. */
	DO ~ActionOverride("Montaron",EscapeArea())
	EscapeArea()~
EXIT

CHAIN JNXZA9 sodx1.2
	@27 /* Now, now. Don't you want to have a chat with dear old Xzar? */
	== JNXZA9 @28 /* Tell me, why are you here? */
END
+ ~~ + @13 EXTERN JNXZA9 sodx1.1. /* Caelar Argent has tried to kill me, so I would like to return the favor. */
+ ~~ + @14 EXTERN JNXZA9 sodx1.1. /* I need to find out what this crusade is about and what the Shining Lady's goals are. */
	
// If Montaron dies before both are recruited, Xzar leaves
CHAIN IF ~OR(2) Dead("Montaron") !Range("Montaron",30)~ THEN JNXZA9 sodx3
	@0 /* Oh poor Montaron. */
	== JNXZA9 @1 /* You must excuse me, but I have to find Montaron, as I seem to have lost him. */
	DO ~EscapeArea()~
EXIT
