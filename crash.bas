10 'Club 100 Library - 415/939-1246 BBS     937-5039 NEWSLETTER, 932-8856 VOICE
15 'Converted to Amstrad CPC March 2019 by SRS (cpcwiki.eu)
16 DEFINT a-z
20 GOSUB 5000'  INITIALIZE
30 GOSUB 1000'  INPUT
40 GOSUB 2000'  SORT
45 GOSUB 4400'  CHECKS
50 IF WF=0 AND LF=0 THEN 30
60 GOSUB 5500' END
70 END
1000 VB$="":NO$=""
1020 INPUT"WHAT DO YOU DO NEXT ";R$:r$=UPPER$(R$)
1030 FOR I=1 TO LEN(R$)
1040 IF MID$(R$,I,1)=" " THEN VB$=LEFT$(R$,3):NO$=MID$(R$,I+1,3):I=LEN(R$)
1050 NEXT I
1060 IF NO$<>"" THEN RETURN
1070 R$=LEFT$(R$,3)
1080 IF R$="NOR" OR R$="SOU" OR R$="EAS" OR R$="WES" THEN VB$="GO ":NO$=R$:RETURN
1090 IF R$="HEL" OR R$="INV" OR R$="LOO" OR R$="SLE" THEN NO$="DOO":VB$=R$:RETURN
1100 PRINT"I DON'T UNDERSTAND THAT."
1110 GOTO 1000
2000 VB=0:NO=0:FOR I=1 TO VV
2020 IF VB$=LEFT$(VB$(I),3) THEN VB=I:I=VV
2030 NEXT I
2040 FOR I=1 TO NN
2050 IF NO$=NO$(I) THEN NO=I:I=NN
2060 NEXT I
2070 IF NO=0 OR VB=0 THEN PRINT"I DON'T UNDERSTAND THAT.":RETURN
2080 ON VB GOTO 3000,3100,3200,3300,3400,3500,3620,3700,3800,3900,4000,4200,4300
3000 ' ************ GO ****************
3010 IF NO>4 THEN PRINT"GO WHERE ?":RETURN
3020 IF EX(CP,NO)=0 THEN PRINT"NO MOVEMENT POSSIBLE THAT WAY.":RETURN
3030 IF EX(CP,NO)=99 THEN LF=2:RETURN
3035 IF (CP=10 OR CP=14 OR CP=15) AND DELAY<2 THEN DELAY=DELAY+1:GOTO 4000 ELSE DELAY=0
3037 IF DARK=1 THEN LF=8:RETURN
3040 CP=EX(CP,NO):GOTO 4000
3100 ' ************ GET ***************
3120 IF NO<7 THEN PRINT"DON'T BE SILLY.":RETURN
3130 IF OB(NO-6)=99 THEN PRINT"YOU'VE ALREADY GOT IT!":RETURN
3140 IF OB(1)=99 AND OB(9)<>50 AND OB(9)<>99 THEN OB(9)=3
3170 IF OB(NO-6)=CP THEN PRINT"O.K.":OB(NO-6)=99:IN=IN+1:RETURN
3180 PRINT"IT ISN'T HERE!":RETURN
3200 ' ************** FEED ************
3210 IF NO<13 THEN PRINT"DON'T BE SILLY!":RETURN
3250 IF OB(3)<>99 AND OB(6)<>99 THEN PRINT"YOU DON'T HAVE ANYTHING  TO  USE!":RETURN
3255 IF CP<>4 AND CP<>23 THEN PRINT"YOU CAN'T HERE.":RETURN
3260 IF FIRE<>1 THEN PRINT"IT ISN'T LIT YET!":RETURN
3265 IF CP=23 AND FI2<>1 THEN PRINT"IT ISN'T LIT YET!":RETURN
3270 IF CP=4 THEN OB(3)=0:PRINT"O.K.":RETURN
3280 IF CP=23 THEN OB(6)=0:PRINT"O.K.":LD=LD+1:RETURN
3300 ' ************* MELT *************
3305 IF CP<>4 THEN PRINT"YOU CAN'T HERE!":RETURN
3310 IF OB(4)<>99 THEN PRINT"YOU DON'T HAVE ANYTHING  TO  USE.":RETURN
3320 IF FIRE<>1 THEN PRINT"YOU CAN'T... YET.":RETURN
3325 IF NO<>16 THEN PRINT"MELT WHAT?":RETURN
3330 PRINT"O.K.":MELT=1:RETURN
3400 ' ************* DRINK ************
3410 IF NO<>17 THEN PRINT"DRINK WHAT?":RETURN
3420 IF MELT<>1 THEN PRINT"YOU DON'T HAVE ANY!":RETURN
3430 PRINT"THAT'S REFRESHING.":DRINK=1:RETURN
3500 ' ************** EAT *************
3510 IF OB(9)<>99 THEN PRINT"YOU DON'T HAVE ANYTHING":RETURN
3515 IF NO<>15 THEN PRINT"EAT WHAT?":RETURN
3520 PRINT"IT'S HARD BUT TASTES MIGHTY GOOD.":OB(9)=50:RETURN
3620 ' ************* MAKE *************
3630 IF NO=13 AND CP<>4 THEN PRINT"YOU CAN'T HERE.":RETURN
3640 IF NO=14 AND (CP=4 OR CP=23) THEN 3700
3650 IF OB(5)<>99 THEN PRINT"YOU DON'T HAVE ONE.":RETURN
3660 IF NO=13 AND OB(5)=99 THEN PRINT"O.K. THAT FEELS BETTER":OB$(5)="SPLINT":RETURN
3670 PRINT"MAKE WHAT?":RETURN
3700 ' ************* LIGHT ************
3710 IF OB(2)<>99 THEN PRINT"YOU DON'T HAVE ANY MATCHES!":RETURN
3720 IF CP=4 AND OB(3)<>99 THEN PRINT"YOU DON'T HAVE ANY FUEL":RETURN
3730 IF CP=4 AND GAS<>1 THEN PRINT"THEY WON'T BURN... YET.":RETURN
3740 IF CP=23 AND OB(6)<>99 THEN PRINT"YOU DON'T HAVE ANY FUEL":RETURN
3745 IF CP<>4 AND CP<>23 THEN PRINT"YOU CAN'T HERE.":RETURN
3750 PRINT"O.K.":FIRE=1:IF CP=4 THEN OB(3)=5:OB(8)=4:RETURN
3760 IF CP=23 THEN OB(6)=25:FI2=1:LD=LD+1:OB(8)=23:RETURN
3800 ' ********** INVEN TO RY ***********
3810 PRINT:PRINT"YOU ARE CARRYING:"
3820 IF IN=0 THEN PRINT"NOTHING!":RETURN
3830 FOR I=1 TO 10
3840 IF OB(I)=99 THEN PRINT", A ";OB$(I);
3850 NEXT I:PRINT:RETURN
3900 ' ************** HELP ************
3910 PRINT:PRINT"THESE ARE THE VERBS YOU MAY USE:"
3920 FOR I=1 TO VV:PRINTVB$(I)", ";:NEXT:PRINT
3930 PRINT"(You need only type the first three     letters.)":RETURN
4000 ' ************ LOOK **************
4010 PRINT:PRINT LO$(CP):IF CP=22 OR CP=6 OR CP=11 THEN LF=1:RETURN
4020 FOR I=1 TO 9
4040 IF OB(I)=CP THEN PRINT"A ";OB$(I);" IS HERE"
4050 NEXT I
4060 PRINT CHR$(24)CHR$(7);"Possible movement: ";
4070 IF EX(CP,1)>0 THEN PRINT"north ";
4080 IF EX(CP,2)>0 THEN PRINT"south ";
4090 IF EX(CP,3)>0 THEN PRINT"east ";
4100 IF EX(CP,4)>0 THEN PRINT"west";
4110 PRINT CHR$(24):RETURN
4200 '*********** DRAIN ***************
4210 IF NO<>18 THEN PRINT"DRAIN WHAT?":RETURN
4220 IF CP<>3 THEN PRINT"THERE'S NONE HERE...":RETURN
4230 IF OB(4)<>99 THEN PRINT"IN TO  WHAT?":RETURN
4240 PRINT"O.K.":GAS=1:RETURN
4300 '************** SLEEP ************
4310 IF FIRE<>1 OR CP<>4 THEN PRINT"IT'S  TO O COLD HERE!":RETURN
4320 IF DRINK<>1 THEN PRINT"YOU'RE  TO O THIRSTY  TO  SLEEP.":RETURN
4330 PRINT"YOU QUICKLY DOZE OFF BY THE FIRE.":FOR I=1 TO 1000:NEXT:PRINT:PRINT"AFTER FIRST LIGHT THE SOUND OF A NEARBY PLANE AWAKENS YOU!":PRINT CHR$(7):PRINT" TO O BAD THE FOG'S SO THICK.":SLEEP=1:RETURN
4400 MV=MV+1:IF OB$(5)<>"SPLINT" THEN PRINT" YOUR LEG IS VERY PAINFUL":IF MV>6 THEN LF=3:RETURN ELSE RETURN
4410 IF OB(1)<>99 THEN PRINT" IT'S VERY COLD.":IF MV>8 THEN LF=4:RETURN ELSE RETURN
4415 IF MV<10 THEN RETURN
4420 IF DRINK<>1 AND MV/2=INT(MV/2) THEN PRINT" YOU'RE VERY THIRSTY":IF MV>24 THEN LF=5:RETURN
4430 IF OB(9)<>50 AND MV/2<>INT(MV/2) THEN PRINT" YOU'RE VERY HUNGRY.":IF MV>20 THEN LF=6:RETURN
4440 IF MV>18 AND SLEEP<>1 AND MV/2<>INT(MV/2) THEN PRINT" IT'S GETTING DARK.":IF MV>25 THEN DARK=1:RETURN
4445 IF MV=45 THEN PRINT:PRINT"YOU HEAR A HELICOPTER APPROACHING.":PRINT CHR$(7):FOR I=1 TO 1000:NEXT:IF LD>1 THEN PRINT"THEY SEEM TO SEE YOUR LARGE FIRE...":FOR I=1 TO 1000:NEXT:WF=1:RETURN
4447 IF MV=45 THEN PRINT"BUT THEY DON'T SEE YOU...":FOR I=1 TO 1000:NEXT:RETURN
4450 IF MV>49 THEN LF=7:RETURN
4460 RETURN
5000 CLS:PRINT:PRINT TAB(10)"CAN YOU SURVIVE?":PRINT:FOR I=1 TO 500:NEXT:PRINT TAB(15)"By Russ Hall":PRINT:PRINT"(C)onverted to CPC by SRS in 2019":PRINT"Please press CAPS-LOCK.":FOR I=1 TO 2000:NEXT 
5010 CLS:PRINT"You were on a business trip in a singleengine plane. Bad weather crossing high";
5020 PRINT"mountains suddenly came up, causing you to crash into a rough slope. You much"
5030 PRINT"later awake to consciousness in a cold, quiet, and foggy world with a terrible"
5040 PRINT"pain inside your right leg.(If you  need game assistance, type 'help'.)";
5050 FOR I=1 TO 4500:NEXT:PRINT
5090 NN=18:VV=13:CP=3:IN=1:WF=0:LF=0:UF=0:CF=0
5100 DIM LO$(25):DIM EX(25,4):DIM NO$(18):DIM VB$(13):DIM OB$(10):DIM OB(10)
5110 FOR I=1 TO 25
5120 IF I=11 THEN LO$(I)=LO$(6):GOTO 5140
5124 IF I=14 OR I=15 THEN LO$(I)=LO$(10):GOTO 5140
5126 IF I=20 OR I=25 THEN LO$(I)=LO$(16):GOTO 5140
5130 READ D$:LO$(I)=D$
5140 NEXT I
5150 FOR I=1 TO 25:FOR J=1 TO 4:READ EX(I,J):NEXT J,I
5160 FOR I=1 TO 9:READ OB$(I):READ OB(I):NEXT 
5170 FOR I=1 TO NN:READ NO$(I):NEXT 
5180 FOR I=1 TO VV:READ VB$(I):NEXT 
5190 GOSUB 4000:RETURN' LOOK
5500 IF WF=1 THEN 5610 ELSE ON LF GOTO 5510,5520,5530,5540,5550,5560,5570,5580,5590
5510 IF CP=22 THEN PRINT"YOU SLIP ON THE SNOW AND SLIDE IN TO ROCKS BELOW.":GOTO 5600
5515 PRINT"YOU SLIP AND TUMBLE OVER THE ROCKS.":GOTO 5600
5520 PRINT"YOU HAVE FALLEN OFF THE CLIFF!":GOTO 5600
5530 PRINT"YOUR PAIN KEEPS YOU FROM MOVING FURTHER,AND YOU CANNOT KEEP WARM.":GOTO 5600
5540 PRINT"HYPOTHERMIA SETS IN AND YOU SHIVVER UNCONTROLABLY.":GOTO 5600
5550 PRINT"ONE CAN'T LAST LONG WITHOUT WATER.":GOTO 5600
5560 PRINT"WITHOUT THE ENERGY OF FOOD, HYPOTHERMIA SETS IN.":GOTO 5600
5570 PRINT"YOU HAVE BEEN TOO LONG IN THE COLD.":GOTO 5600
5580 PRINT"YOU CAN'T SEE TO MANEUVER SAFELY AND    STUMBLE IN THE ROCKS, KNOCKING YOURSELF UNCONSCIOUS.":GOTO 5600
5600 PRINT"YOU HAVE FAILED TO SURVIVE.":GOTO 5640
5610 PRINT"THE  RESCUE COPTER LOWERS A LADDER AND MAN TO ASSIST YOU GRATEFULLY UP.CONGRADULATIONS! YOU HAVE SURVIVED!"
5640 FOR I=1 TO 1000:NEXT:INPUT"DO YOU WISH  TO  TRY AGAIN?";R$
5650 IF LEFT$(R$,1)="Y" THEN RUN
5660 PRINT"BYE-BYE":FOR F=1 TO 1000:NEXT:END
6010 DATA "THE MOUNTAIN SIDE SLOPES DOWN STEEPLY TO THE SOUTH.THE WAY  WEST IS BLOCKED BY A ROCKSLIDE."
6020 DATA "SOME CHRASH DEBRIS SHOWS HERE THROUGH THE FOG AND SNOW COVERING."
6030 DATA "YOU ARE AT THE CRASH SITE.PIECES OF THE PLANE SURROUND YOU."
6040 DATA "YOU ARE ON A GENTLE,SOUTHERN SLOPING,SNOWY MOUNTAIN  SIDE."
6060 DATA "YOU CAN SEE VERY DENSE FOREST TO THE SOUTH AND EAST."
6070 DATA "THE MOUNTAIN SIDE HERE IS VERY STEEP,YOU HAVE TROUBLE MANEUVERING"
6080 DATA "HERE YOU SEE THE HILLSIDE SLOPE DOWN MORE STEEPLY ON THE WEST."
6090 DATA "THE FOG SEEMS TO BE THINNING DOWN THE MOUNTAIN,AND A ROCKY CLIFF EDGE RUNS ALONG THE SOUTH HERE."
6100 DATA "A CLIFF EDGE IS TO THE SOUTH AND DENSE FOR EST ON THE EAST."
6120 DATA "YOU ARE IN THE THICK FOR EST.IT'S DIFFICULT TO KNOW YOUR WAY."
6121 DATA "THIS IS A BEAUTIFUL,WIDE MORAINE FIELD WITH STEEP SLOPES WEST."
6122 DATA "YOU ARE AT THE  BASE OF A ROCKY CLIFF TO THE NORTH,DENSE FOREST TO THE EAST."
6130 DATA "YOU ARE ON A BEAUTIFUL FOR ESTED MOUNTAINSIDE."
6140 DATA "THERE IS A LARGE,STEEP SNOWFIELD TO THE SOUTH."
6145 DATA "YOU ARE ON A ROCKY,SLOPING  MOUNTAIN SIDE."
6150 DATA "THE FOREST IS THINNER HERE BUT MUCH DENSER TO THE NORTH."
6155 DATA "A STEEP,SLICK SNOWFIELD BLOCKS YOUR WAY EAST."
6160 DATA "YOU ARE ON A STEEP,SLICK SNOWFIELD."
6170 DATA "YOU'RE IN A CLEARING HERE,WITH A STEEP SNOWFIELD WEST."
6180 DATA "YOU'RE ON A SLOPING MOUNTAIN SIDE WITH CLOUDS HIGH ABOVE YOU."
6220 DATA 0,6,2,0, 0,0,3,1, 0,0,4,2, 0,9,5,3, 0,10,0,4
6230 DATA 1,11,7,0, 0,12,8,6, 0,99,9,7, 4,99,10,8, 5,15,0,9
6240 DATA 6,16,12,0, 7,17,13,11, 0,18,14,12, 0,19,15,13, 10,0,0,14
6250 DATA 11,21,17,0, 12,22,18,16, 13,23,19,17, 14,24,20,18, 15,0,0,19
6260 DATA 16,0,22,0, 17,0,23,21, 18,0,24,22, 19,0,25,23, 20,0,0,24
6310 DATA COAT,3,BUTANE LIGHTER,2,BUNCH OF STICKS,5,ALUMINUM CAN,1,STRAIGHT LIMB,4,MESS OF FALLEN TIMBER,25
6320 DATA SPLINT,0,FIRE,0,CANDY BAR,0
6510 DATA NOR,SOU,EAS,WES,DOO,PLA,COA,LIG,STI,CAN,LIM,TIM,SPL,FIR,BAR,SNO,WAT,GAS
6530 DATA GO,GET,FEED,MELT,DRINK,EAT,MAKE,LIGHT,INVENTORY,HELP,LOOK,DRAIN,SLEEP