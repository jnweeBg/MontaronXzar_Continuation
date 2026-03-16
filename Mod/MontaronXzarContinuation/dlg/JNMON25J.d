BEGIN JNMON25J

/* =====================================
======== Mandatory Interjections =======
===================================== */

// Volo in Saradush

EXTEND_TOP SARVOLO 9 #2
+ ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ + @0 /* Tell me about Montaron. */ + JNMONTVoloBio
END

CHAIN SARVOLO JNMONTVoloBio
@1 /* Ah, the deadly rogue, who came back from death to prey upon your enemies. There's little mercy found in him and anyone should pray to never meet him, or rather meet his blade as you will feel cold steel in your chest, before you'd be aware of his presence. */
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @2 /* Ye're good. Keep it up and ye'll never have to worry 'bout me comin' for ye. */
EXTERN SARVOLO 9

// Solar at the end of ToB

I_C_T FINSOL01 27 JNMONTSolar
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID) !Global("JNMONTGoodEnding","GLOBAL",1)~ THEN @3 /* What choice be there? There's power to gain <CHARNAME>, don't ye be a fool. */
END

I_C_T FINSOL01 27 JNMONTSolar
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID) GlobalGT("JNMONTGoodEnding","GLOBAL",1)~ THEN @4 /* Not an easy choice ye have. Lately I've been thinking and havin' some time without bein' bothered is nice. Won't have that if ye fight with mighty gods, so ye better not regret yer choice. */
END

/* =====================================
========== Other Interjections =========
===================================== */

// Sarevok

I_C_T SAREV25A 0 JNMONTSarevokInit
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @5
END

I_C_T SAREV25A 38 JNMONTSarevokInit2
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @6
END

I_C_T SAREV25A 53 JNMONTSarevokInit2
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @7
END

// Boy with dead father in Saradush - "FRaise","GLOBAL" = 1 means dad is resurrected, 0 means not

I_C_T ORPHAN1 2 JNMONTOrphan1
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @8
END

// Oris Nimblefinger (Bhaalspawn in Saradush)

I_C_T SARBHA02 1 JNMONTSarBha0201
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1000
END

// Human dwarf conflict

I_C_T SARBUL01 1 JNMONTSarBul0101
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1001
END

INTERJECT SARDW01 1 JNMONTSarDw0101
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1002
== SARDW01 IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1003
DO ~AddXP2DA("PLOT27A") SetGlobal("StopFighting","AR5000",1)~
EXIT

// Saradush Il-Khan Soldiers & waitress

I_C_T SARBUL06 2 JNMONTSarWai010
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1004
END

// Kiser Jhaeri & The Countess

I_C_T SARCNT01 7 JNMONTSarCnt017
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1005
END

I_C_T SARKIS01 20 JNMONTSarKis0120
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1006
END

// Melissan after Gromnir

I_C_T SARMEL01 53 JNMONTSarMel0153
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1007
END

// Asana in Amkethran

I_C_T AMASANA 4 JNMONTAmAsana05
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1008
END

// Monks in Amkethran market

I_C_T AMMONK02 3 JNMONTAmMonk0203
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)~ THEN @1009
END

// Carras

I_C_T AMCARRAS 3 JNMONTAmCarras03
== JNMON25J IF ~InParty("%jnmontdv%") InMyArea("%jnmontdv%") !StateCheck("%jnmontdv%",CD_STATE_NOTVALID)
	Global("SaemonPlot","GLOBAL",1)~ THEN @1010
END

/* =====================================
================ Talks =================
===================================== */

// ToB Talk (Will probably be the only one and determine the good vs bad ending)

CHAIN IF ~Global("JNMONT25Talk","GLOBAL",2)~ THEN JNMON25J 25t1
	@9 /* Ye have grown in power a lot while we travel together, how does it feel? */
	DO ~SetGlobal("JNMONT25Talk","GLOBAL",3)~
END
+ ~~ + @10 EXTERN JNMON25J 25t1.1 /* I feel like, while I am getting stronger my enemies do too. */
+ ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID) OR(2) Global("FRaise","GLOBAL",1) !ReputationLT([PC], 16)~ +  @27 EXTERN JNMON25J 25t1.4 /* A lot of people die by my hand. I hope it will be worth it in the end. */
+ ~~ + @11 EXTERN JNMON25J 25t1.2 /* I just wish for all of this to be over to have some time for myself. */
+ ~OR(3) !InParty("Nalia") !InMyArea("Nalia") StateCheck("Nalia",CD_STATE_NOTVALID)~ + @12 EXTERN JNMON25J 25t1.3 /* I feel good. Finally I can help out where help is needed. */
+ ~!Global("FRaise","GLOBAL",1) ReputationLT([PC], 18)~ + @13 EXTERN JNMON25J 25t1.4 /* I feel great. Finally I can crush those that are in my way. */


CHAIN JNMON25J 25t1.1
	@14 /* Right ye are, but the stronger an enemy, the more fun it be to hear 'em beg for mercy. */
	== JNMON25J @15 /* But what about yourself, how do ye feel about yer own power? */
END
+ ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID) OR(2) Global("FRaise","GLOBAL",1) !ReputationLT([PC], 16)~ +  @27 EXTERN JNMON25J 25t1.4 /* A lot of people die by my hand. I hope it will be worth it in the end. */
+ ~~ + @11 EXTERN JNMON25J 25t1.2 /* I just wish for all of this to be over to have some time for myself. */
+ ~OR(3) !InParty("Nalia") !InMyArea("Nalia") StateCheck("Nalia",CD_STATE_NOTVALID)~ + @12 EXTERN JNMON25J 25t1.3 /* I feel good. Finally I can help out where help is needed. */
+ ~!Global("FRaise","GLOBAL",1) ReputationLT([PC], 18)~ + @13 EXTERN JNMON25J 25t1.4 /* I feel great. Finally I can crush those that are in my way. */

CHAIN JNMON25J 25t1.2
	@30 /* With yer power ye could challenge the gods themselves and ye want time for yerself? Pathetic. */
END
IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID) Global("JNMONTNaliaFriends","GLOBAL",1)~ THEN DO ~~ EXTERN NALIA25J JNMONT25t1.n2
+ ~OR(4) !InParty("Nalia") !InMyArea("Nalia") StateCheck("Nalia",CD_STATE_NOTVALID) !Global("JNMONTNaliaFriends","GLOBAL",1)~ + @32 EXTERN JNMON25J 25t1.2.1 /* I don't want to spend all my life fighting. Do you? */
+ ~OR(4) !InParty("Nalia") !InMyArea("Nalia") StateCheck("Nalia",CD_STATE_NOTVALID) !Global("JNMONTNaliaFriends","GLOBAL",1)~ + @33 EXTERN JNMON25J 25t1.2.2 /* The gods don't go anywhere, I just need a break from all this fighting and killing. */

CHAIN NALIA25J JNMONT25t1.n2
	@31 /* There is more to life. People die everyday, some by your hand. Why wouldn't you stop if you could? */
END
IF ~~ THEN DO ~~ EXTERN JNMON25J 25t1.n4

CHAIN JNMON25J 25t1.2.1
	@34 /* What else be there. If ye're weak, ye get nothing but a painful death. */
END
+ ~~ + @35 EXTERN JNMON25J 25t1.2.1.1 /* But if you have the choice. Would you choose to fight, instead of peace? */
+ ~~ + @36 EXTERN JNMON25J 25t1.2.1.1 /* There is no strength in unnecessary killing. */
+ ~~ + @37 EXTERN JNMON25J 25t1.2.1.1 /* I knew peace as a child. It was nice and comfortable. */
+ ~~ + @38 EXTERN JNMON25J 25t1.2.1.4 /* You're right. We can not let our enemies gain on us, so let's move on. */

CHAIN JNMON25J 25t1.2.1.1
	@39 /* Pah. What fun be there in life if ye have no one to kill. */
END
+ ~~ + @40 EXTERN JNMON25J 25t1.2.1.1.1 /* Aren't you sick of fighting? Sick of people? */
+ ~OR(2) Class([PC],CLERIC_ALL) Class([PC],PALADIN_ALL)~ + @41 EXTERN JNMON25J 25t1.2.1.1.2 /* There is a lot more than fighting to life. You can find great satisfaction from connection to your god. */
+ ~OR(2) Class([PC],DRUID_ALL) Class([PC],RANGER_ALL)~ + @42 EXTERN JNMON25J 25t1.2.1.1.4 /* You can find great harmony and solitude in nature, if you give it a chance. */
+ ~OR(2) Class([PC],THIEF_ALL) Class([PC],BARD_ALL)~ + @43 EXTERN JNMON25J 25t1.2.1.1.1 /* All the fighting makes you rich and tells good stories, but those aren't worth anything, if you never stop to spend your riches or tell your stories. */
+ ~OR(2) Class([PC],FIGHTER_ALL) Class([PC],MONK)~ + @44 EXTERN JNMON25J 25t1.2.1.1.1 /* You can train your body and sharpen your senses in peace. And even solitude if you desire so. */
+ ~Class([PC],MAGE_ALL)~ + @45 EXTERN JNMON25J 25t1.2.1.1.3 /* There is a lot to learn about this world we live in. You can find peace in the books and scrolls the libraries have to offer, with no one to bother you. */

CHAIN JNMON25J 25t1.2.1.1.1
	@46 /* Ye say I could just leave it all.. I'll have to think on yer words. */
	DO ~IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
EXIT

CHAIN JNMON25J 25t1.2.1.1.2
	@47 /* Hah! And what god be foolish 'nough to take me in. Ye make fun o' me and I'll no have it. */
	== JNMON25J @48 /* There be nothing after death — just endless pain. I'll no sit around waitin' for it. */
END
+ ~~ + @49 EXTERN JNMON25J 25t1.2.1.1.2.1 /* You are wrong. If you are true to your god, he will save you. */

CHAIN JNMON25J 25t1.2.1.1.2.1
	@50 /* Ye seem to know what ye're talkin' about, but I'll no worhsip some god. Preach to someone else, I will hear no more. */
	DO ~IncrementGlobal("JNMONTGoodEnding","GLOBAL",2)~
EXIT

CHAIN JNMON25J 25t1.2.1.1.3
	@51 /* Pah. There be nothing I seek in books or scrolls. Leave me be, fool. */
	DO ~IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
EXIT

CHAIN JNMON25J 25t1.2.1.1.4
	@55 /* I no like the forest, but at least ye're on yer lonesome there. */
	DO ~IncrementGlobal("JNMONTGoodEnding","GLOBAL",2)~
	== JNMON25J @56 /* As long as ye tree huggers keep away from me, I could just sit in silence, eh. Never tried that, but it sounds.. well. */
EXIT

CHAIN JNMON25J 25t1.2.1.4
	@52 /* Let's show'em yer wrath. */
EXIT

CHAIN JNMON25J 25t1.2.2
	@53 /* Let me face them with ye, they'll fall one by one. */
EXIT

CHAIN JNMON25J 25t1.3
	@54 /* Ye make me sick. Let's keep moving 'fore I empty me guts on the ground. */
EXIT

CHAIN JNMON25J 25t1.4
	@16 /* It be a rush. I 'member the first time I put a dagger in a man. Suddenly he was just dead meat, nothing ye'd have to fear anymore. */
END
IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN DO ~~ EXTERN NALIA25J JNMONT25t1.n4
IF ~OR(3) !InParty("Nalia") !InMyArea("Nalia") StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN DO ~~ EXTERN JNMON25J 25t1.4.1

CHAIN NALIA25J JNMONT25t1.n4
	@17 /* Why can you not see? You are that man for others! */
END
IF ~Global("JNMONTNaliaFriends","GLOBAL",1)~ THEN DO ~~ EXTERN JNMON25J 25t1.n4
IF ~!Global("JNMONTNaliaFriends","GLOBAL",1)~ THEN DO ~~ EXTERN JNMON25J 25t1.n5

CHAIN JNMON25J 25t1.4.1
	@18 /* With power like yers we are destined for great things, I feel it. */
	DO ~IncrementGlobal("JNMONTBadEnding","GLOBAL",1)~
EXIT


CHAIN JNMON25J 25t1.n4
	@19 /* What makes ye think I care? Ye're a lousy mage and an even lousier thief! */
	DO ~IncrementGlobal("JNMONTGoodEnding","GLOBAL",1)~
	== NALIA25J @20 /* You lash out at me, but your words can't hurt me. The reason I anger you is you know I am right. */
	= @21 /* You understand the hatred and evil in people and deep down you know it to be wrong. */
	== JNMON25J @22 /* Ye irritate me, girl. If I be so bad, why don't ye just try and kill me? */
	== NALIA25J @23 /* You are a tortured man, not my enemy. I won't choose violence, when I can choose words. */
	== JNMON25J @24 /* Heh, an angel ye are, but not all of us can be. */
	== NALIA25J @25 /* *sigh* Just give yourself a chance, Montaron. */
	== JNMON25J @26 /* Heh, I be lost to yer cause, girl. Sooner ye accept it, the sooner I'm freed of yer preaching. */
EXIT

CHAIN JNMON25J 25t1.n5
	@28 /* Ye know nothing of me! Best ye shut yer trap or I'll shut it for ye. */
	== NALIA25J @20 /* You lash out at me, but your words can't hurt me. The reason I anger you is you know I am right. */
	== JNMON25J @29 /* Ye're right. My words can't hurt ye, but me dagger can. So 'fore ye say another word think on that. */
EXIT
