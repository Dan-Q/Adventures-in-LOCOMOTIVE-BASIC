10 ' Teeny Tiny Text Adventure  v1.1 By Tim Ekdom.
20 ' in lines 10 through 20.
30 'converted to AMSTRAD CPC 042019 by SRS www.cpcwiki.eu
40 MODE 2:INK 0,13:BORDER 13:INK 1,0
100 DEFINT A-Z:DEFSTR T:T="  ":Z=0:N=Z:I=1:GOSUB 3100:CLS
102 PRINT:PRINT T;"Time: 4:37 PM, mid November":CT=Z:GOSUB 1650
104 PRINT T;"Location: ";LO$(CH(Z))
106 GOSUB 400:GOSUB 500:MF=Z:MG=Z:LINE INPUT"  >";IN$:CT=CT+1
108 GOSUB 600:IF MG THEN PRINT T;MG$(MG):GOTO 106
110 IF MF THEN GOSUB 1200:IF MG=Z THEN GOTO 104 ELSE PRINT T;MG$(MG):GOTO 106
112 IF VE<3 OR VE=7 OR VE=15 OR VE=21 THEN 116
114 GOSUB 700:IF MG THEN PRINT T;MG$(MG):GOTO 106
116 ON VE GOSUB 1700,1650,1950,1400,1450,1750,2150,2200,1300,1350,1500,1550,1600,1800,1850,1900,2000,2050,2100,2250,1860
117 IF MG THEN PRINT T;MG$(MG)
118 IF MF THEN 104 ELSE 106
200 OF=Z:OD=Z:FOR N=I TO 10:IF OC=IT(CH(Z),N) THEN OF=I:OD=N:N=11
202 NEXT:RETURN
300 OF=Z:OA=Z:FOR N=4 TO 8:IF OC=CH(N) THEN OF=I:OA=N:N=9
302 NEXT:RETURN
400 IF CH(Z)<>Z THEN RETURN
402 OC=33:GOSUB 200:IF OF=Z THEN RETURN
404 IF OB(33,4)<>32 THEN RETURN
406 FOR N=I TO 200:NEXT
408 CLS:PRINT"CONGRATULATIONS!!"
410 PRINT"Mission accomplished...";:GOTO 1852
500 IF CT<19 THEN RETURN
502 IF CT=19 THEN PRINT T;"It's getting dark"
504 IF CT<29 THEN RETURN
506 IF CT=29 THEN PRINT T;"It's cold here"
508 IF CT<39 THEN RETURN
510 OC=19:GOSUB 300:IF OF AND (CT=39 OR CT=59)THEN PRINT T;"The flashlight is getting dim"
512 IF CT<49 THEN RETURN
514 IF CT=49 THEN CH(I)=I:PRINT T;"You're thirsty":RETURN
516 IF CT<63 THEN RETURN
517 IF CT=63 AND CF=Z AND SM=Z THEN CH(2)=I:PRINT T;"You're getting cold":RETURN
518 IF CT<73 THEN RETURN
520 IF OF=Z AND LT=Z THEN CH(3)=Z:IF CT=73 THEN PRINT T;MG$(13):RETURN
522 IF CT<79 THEN IF OF THEN CH(3)=I:RETURN ELSE RETURN
524 IF CT=79 THEN OB(19,5)=Z:IF OF AND LT=Z THEN CH(3)=Z:PRINT T;MG$(13)
525 IF OF AND CT=79 THEN PRINT T;"The batteries are dead":RETURN
526 IF CT>=79 THEN IF LT=Z THEN CH(3)=Z ELSE CH(3)=I
528 IF CH(I) AND (CT/11=INT(CT/11))THEN PRINT T;"You're very thirsty":RETURN
530 IF CH(2) AND (CT/13=INT(CT/13))THEN PRINT T;"You're freezing cold":RETURN
532 IF SM AND (CT/8=INT(CT/8)) AND CH(Z)>2 AND CH(Z)<10 THEN PRINT T;"It's really smoky in here":RETURN
534 IF CT<199 THEN RETURN
536 IF SM AND CH(Z)>I THEN DD=I:GOTO 800
538 IF CH(I) THEN DD=2:GOTO 800
540 IF CH(2) THEN DD=3:GOTO 800
542 RETURN
600 VE=Z:OJ=Z:IF LEN(IN$)=I THEN IF INSTR(I,"NSEWUD",IN$) THEN MF=I:RETURN ELSE MG=11:RETURN
602 SP=INSTR(I,IN$," "):IF SP=Z THEN VE$=IN$:GOTO 606
604 VE$=LEFT$(IN$,SP-I)
606 FOR N=I TO 21:IF VE$=VB$(N) THEN VE=N:N=22
610 NEXT
612 IF VE=Z THEN MG=11:RETURN
613 IF VE<3 OR VE=15 OR VE=21 THEN RETURN
614 OJ$=RIGHT$(IN$,LEN(IN$)-SP)
616 LO=I:HI=48
618 IF LO>HI THEN MG=11:RETURN
620 MD=INT((HI+LO)/2)
622 IF OJ$=OB$(MD) THEN OJ=MD:RETURN
624 IF OJ$<OB$(MD) THEN HI=MD-1:GOTO 618
626 IF OJ$>OB$(MD) THEN LO=MD+1:GOTO 618
700 IF VE=5 THEN RETURN ELSE X=VM(VE)
702 FOR N= X TO X+21
704 IF VM(N)=OJ THEN N=X+22:GOTO 708
706 IF VM(N)=Z THEN MG=12:N=X+22
708 NEXT:RETURN
800 CLS:PRINT"SORRY!":PRINT"You died from ";DD$(DD):GOTO 1852
1200 IF INSTR(I,MV$(CH(Z)),IN$)=Z THEN MG=8:RETURN
1202 ON CH(Z)+I GOTO 1205,1210,1215,1220,1225,1230,1235,1240,1245,1250,1255,1260,1265,1270,1275,1280,1285
1205 MG=14:RETURN
1210 IF IN$="N" THEN CH(Z)=2:RETURN ELSE MG=14:RETURN
1215 IF IN$="E" THEN CH(Z)=13:RETURN
1216 IF IN$="W" THEN CH(Z)=16:RETURN
1217 IF IN$="S" THEN CH(Z)=I:RETURN
1218 IF IN$="N" THEN CH(Z)=3:RETURN
1220 IF IN$="N" THEN CH(Z)=7:RETURN
1221 IF IN$="S" THEN CH(Z)=2:RETURN
1222 IF IN$="W" THEN CH(Z)=4:RETURN
1225 IF IN$="N" THEN CH(Z)=6:RETURN
1226 IF IN$="W" THEN CH(Z)=5:RETURN
1227 IF IN$="E" THEN CH(Z)=3:RETURN
1230 IF IN$="E" THEN CH(Z)=4:RETURN ELSE CH(Z)=8:RETURN
1235 IF IN$="S" THEN CH(Z)=4:RETURN
1240 IF IN$="S" THEN CH(Z)=3:RETURN
1241 IF IN$="D" THEN CH(Z)=9:RETURN
1242 IF IN$="N" THEN CH(Z)=11:RETURN
1245 IF IN$="D" THEN CH(Z)=5:RETURN
1250 IF IN$="U" THEN CH(Z)=7:RETURN
1255 IF IN$="N" THEN CH(Z)=14:RETURN ELSE CH(Z)=13:RETURN
1260 IF IN$="E" THEN CH(Z)=14:RETURN
1261 IF IN$="W" THEN CH(Z)=15:RETURN
1262 IF IN$="S" THEN CH(Z)=7:RETURN
1265 IF IN$="N" THEN CH(Z)=15:RETURN ELSE CH(Z)=16:RETURN
1270 IF IN$="N" THEN CH(Z)=10:RETURN ELSE CH(Z)=2:RETURN
1275 IF IN$="S" THEN CH(Z)=10:RETURN ELSE CH(Z)=11:RETURN
1280 IF IN$="S" THEN CH(Z)=12:RETURN ELSE CH(Z)=11:RETURN
1285 IF IN$="N" THEN CH(Z)=12:RETURN ELSE CH(Z)=2:RETURN
1300 IF CH(Z)=I THEN 1312
1302 IF CH(Z)=Z THEN CH(Z)=I:GOTO 1316
1304 IF CH(Z)=7 THEN CH(Z)=9:GOTO 1316
1306 IF CH(Z)=9 THEN CH(Z)=7:GOTO 1316
1308 IF CH(Z)=5 THEN CH(Z)=8:GOTO 1316
1310 IF CH(Z)=8 THEN CH(Z)=5:GOTO 1316
1311 MG=5:RETURN
1312 OC=33:GOSUB 300:IF OF THEN PRINT T;"OOF!! Too heavy!":RETURN
1314 CH(Z)=Z
1316 MF=I:RETURN
1350 OC=7:GOSUB 300:IF OF=Z THEN MG=6:RETURN
1352 IF OB(7,4)=46 THEN OB(7,4)=Z:CH(I)=Z:MG=I:RETURN
1354 MG=4:RETURN
1400 OC=OJ:GOSUB 300:IF OF=Z THEN MG=6:RETURN
1402 OC=Z:GOSUB 200:IF OF=Zthen PRINT T;"This room is full":RETURN
1404 IF CH(Z)=3 AND OJ=18 THEN OB(17,4)=18:OB(18,3)=17
1410 CH(OA)=Z:IT(CH(Z),OD)=OJ:MG=I
1412 IF OJ=26 THEN LT=Z
1414 RETURN
1450 IF CH(3)=Z THEN MG=13:RETURN
1451 IF OJ=9 THEN 1478
1452 IF OJ=15 THEN 1480
1453 IF OJ=20 THEN 1470
1454 IF(OJ=3 OR OJ=26 OR OJ=30) AND (OB(OJ,Z)=CH(Z)) THEN OC=Z:GOSUB 200:IT(CH(Z),OD)=OJ:OB(OJ,Z)=19:GOTO 1478
1455 IF OB(OJ,Z)=CH(Z) THEN 1460
1456 OC=OJ:GOSUB 300:IF OF THEN 1460
1458 OC=OJ:GOSUB 200:IF OF=Z THEN MG=7:RETURN
1460 IF OB(OJ,3)>Z THEN IF OB(OB(OJ,3),I)<>3 THEN MG=7:RETURN
1462 IF OB(OJ,I)=Z THEN 1478
1464 IF OB(OJ,I)=I THEN MG=2:IF OB(OJ,5)<>Z THEN 1478 ELSE RETURN
1466 IF OB(OJ,I)=2 THEN MG=3:IF OB(OJ,5)<>Z THEN 1478 ELSE RETURN
1468 IF OB(OJ,I)=3 THEN IF OB(OJ,4)=Z THEN MG=4:IF OB(OJ,5)<>Z THEN 1478 ELSE RETURN
1470 PRINT T;"It contains: ";OB$(OB(OJ,4))
1471 IF(OB(OJ,4)=3 OR OB(OJ,4)=26 OR OB(OJ,4)=30) AND (OB(OB(OJ,4),Z)=CH(Z)) THEN OB(OB(OJ,4),Z)=19
1472 OC=OB(OJ,4):GOSUB 200:IF OF THEN RETURN
1474 OC=Z:GOSUB 200:IT(CH(Z),OD)=OB(OJ,4):RETURN
1478 PRINT T;DE$(OB(OJ,5)):RETURN
1480 IF CH(Z)=2 AND FD=Z THEN MG=3:RETURN
1481 IF CH(Z)=3 AND FD=Z THEN MG=2:RETURN
1482 IF(CH(Z)=2 OR CH(Z)=3) AND FD=Ithen PRINT T;DE$(Z):RETURN
1484 IF(CH(Z)=7 OR CH(Z)=11) AND OB(OJ,I)=I THEN MG=2:RETURN
1486 IF CH(Z)=7 THEN PRINT T;DE$(Z):RETURN
1488 IF CH(Z)<>11 THEN MG=5:RETURN
1490 IF OB(OJ,I)=2 THEN MG=3:RETURN
1492 PRINT T;DE$(Z):RETURN
1500 IF OJ=33 THEN 1508
1502 OC=OJ:GOSUB 300:IF OF=Z THEN MG=5:RETURN
1504 IF CH(Z)<>6 THEN PRINT T;"There's no water here!":RETURN
1506 OB(OJ,4)=46:MG=I:RETURN
1508 OC=33:GOSUB 300:IF OF=Z THEN MG=6:RETURN
1510 OC=32:GOSUB 200:IF OF=Z THEN MG=15:RETURN
1512 OB(33,4)=32:OB(33,5)=Z:OB(32,3)=33:OB(32,5)=15:OC=32:GOSUB 200:IT(CH(Z),OD)=Z:MG=I:RETURN
1550 IF CH(Z)<>4 THEN MG=5:RETURN
1552 PRINT T;"There's a paper under it"
1554 OB(34,3)=Z:OB(31,5)=Z:OC=Z:GOSUB 200:IT(4,OD)=34:RETURN
1600 OC=30:GOSUB 300:IF OF=Z THEN MG=15:RETURN
1602 IF OJ=16 THEN 1608
1604 OC=26:GOSUB 300:IF OF=Z THEN MG=12:RETURN
1606 CH(3)=I:LT=I:MG=I:RETURN
1608 IF CH(Z)<>3 THEN MG=12:RETURN
1610 IF OB(17,4)<>18 THEN MG=12:RETURN
1612 OB(17,4)=16:OB(18,3)=Z:OB(16,3)=17:PRINT T;MG$(I):OC=18:GOSUB 200:IT(3,OD)=Z
1614 IF OB(20,4)=6 THEN PRINT T;"Smoke gets in your eyes":SM=I
1616 OB(16,Z)=3:OC=Z:GOSUB 200:IT(3,OD)=16:CH(2)=Z:RETURN
1650 X=Z:PRINT T;"You have: ":FOR N=4 TO 8:IF CH(N)THEN PRINT T;OB$(CH(N)):X=X+1
1652 NEXT:IF X=Z THEN PRINT T;N$
1654 RETURN
1700 IF CH(3)=Z THEN MG=13:RETURN
1702 X=Z:PRINT T;"You see: "
1704 FOR N=I TO 10:IF IT(CH(Z),N)THEN PRINT T;OB$(IT(CH(Z),N)):X=X+1
1706 NEXT:IF X=Z THEN PRINT T;N$
1708 RETURN
1750 IF OB(OJ,I)=Z THEN MG=12:RETURN
1751 IF OJ=15 THEN 1764
1752 IF OB(OJ,Z)<19 AND OB(OJ,Z)<>CH(Z) THEN MG=5:RETURN
1753 IF OB(OJ,I)=2 THEN MG=3:RETURN
1754 IF OB(OJ,2)=Z THEN 1758
1756 OC=OB(OJ,2):GOSUB 300:IF OF=Z THEN MG=12:RETURN
1758 OB(OJ,I)=3:IF OB(OJ,4)=Z THEN MG=I:RETURN
1760 PRINT T;"There's something inside!"
1762 OC=Z:GOSUB 200:IT(CH(Z),OD)=OB(OJ,4):RETURN
1764 IF(CH(Z)=3 OR CH(Z)=2) AND FD THEN MG=16:RETURN
1765 IF CH(Z)=3 THEN FD=I:MV$(2)="NSEW":MV$(3)="NSW":MG=I:RETURN
1766 IF CH(Z)=2 THEN MG=12:RETURN
1768 IF CH(Z)<>7 AND CH(Z)<>11 THEN MG=5:RETURN
1769 IF OB(OJ,I)=3 THEN MG=16:RETURN
1770 IF CH(Z)=7 THEN 1774
1772 IF OB(OJ,I)=2 THEN MG=3:RETURN
1774 OB(OJ,I)=3:MV$(11)="SEW":MV$(7)="NSD":MG=I:RETURN
1800 OC=35:GOSUB 300:IF OF=I THEN 1814
1802 OC=7:GOSUB 300:IF OF=Z THEN MG=12:RETURN
1804 IF OB(7,4)=Z THEN MG=4:RETURN ELSE OB(7,4)=Z
1806 IF CH(Z)<>3 THEN MG=I:RETURN
1808 IF SM=I THEN SM=Z:OB(16,Z)=21:OB(16,3)=Z:OB(17,4)=18:OB(18,3)=I:PRINT T;"The fire's out"
1810 IF CF=0 AND CT>=49 THEN CH(2)=I
1812 RETURN
1814 IF OB(35,4)=Z THEN MG=4:RETURN ELSE OB(35,4)=Z:GOTO 1806
1850 CLS
1852 PRINT"You have completed";CT-1;"turns.":FOR N=I TO 600:NEXT:MENU
1860 MF=I:RETURN
1900 IF CH(3)=Z THEN MG=13:RETURN
1902 IF OJ=28 THEN IF OB(5,I)<>3 THEN MG=7:RETURN
1903 IF(OJ=3 OR OJ=28) AND OB(OJ,Z)=19 THEN MG=1:RETURN
1904 IF OJ=3 OR OJ=28 THEN OC=Z:GOSUB 200:IT(CH(Z),OD)=OJ:OB(OJ,Z)=19:MG=1:RETURN
1906 IF OB(34,3)<>0 THEN MG=7:RETURN
1908 PRINT T;"It reads: 11-6-23":PA=I:RETURN
1950 IF(OJ=3 OR OJ=26 OR OJ=30) AND (OB(OJ,Z)=CH(Z))THEN 1966
1952 OC=OJ:GOSUB 300:IF OF THEN MG=10:RETURN
1954 GOSUB 200:IF OF=Z THEN MG=7:RETURN
1958 OC=Z:GOSUB 300:IF OF=Z THEN MG=9:RETURN
1960 IT(CH(Z),OD)=Z
1962 CH(OA)=OJ:IF OB(OJ,3)=Z THEN MG=I:RETURN
1964 OB(OB(OJ,3),4)=Z:OB(OJ,3)=Z:MG=I:RETURN
1966 OB(OJ,Z)=19:OC=Z:GOSUB 300:IF OF<>Z THEN 1962
1968 OC=Z:GOSUB 200:IT(CH(Z),OD)=OJ:MG=9:RETURN
2000 IF OJ=33 AND CH(Z)=I THEN 2004
2002 GOSUB 1400:RETURN
2004 OC=OJ:GOSUB 300:IF OF=I THEN CH(OA)=Z ELSE MG=6:RETURN
2006 CH(Z)=Z:OC=Z:GOSUB 200:IT(Z,OD)=33:CH(Z)=I:MG=I:RETURN
2050 IF CH(Z)<>5 THEN MG=5:RETURN
2052 IF PA=Z THEN PRINT T;"What's the combination?":RETURN
2054 OB(36,I)=I:PRINT T;"It clicked!":MG=I:RETURN
2100 OC=10:GOSUB 300:IF OF=I THEN CH(OA)=Z:GOTO 2106
2102 GOSUB 200:IF OF=I THEN IT(CH(Z),OD)=Z:GOTO 2106
2104 MG=12:RETURN
2106 MG=I:CF=I:CH(2)=Z:RETURN
2150 OC=I:GOSUB 300:IF OF=Z THEN MG=12:RETURN
2152 OC=OJ:GOSUB 200:IF OF=Z THEN MG=5:RETURN
2154 IF OJ=18 THEN MG=1:RETURN
2156 PRINT T;"Destructive bugger, aren't you?":IF OJ<>47 THEN RETURN
2158 IF CH(Z)=2 THEN OB(47,I)=3:OB(47,5)=Z:MV$(2)="NSEW":MV$(3)="NSW"
2160 PRINT T;"You broke through":RETURN
2200 OC=25:GOSUB 300:IF OF=Z THEN MG=12:RETURN
2202 OC=6:GOSUB 300 IF OF THEN 2204 ELSE GOSUB 200
2204 IF OF THEN MG=I:GOSUB 1762:OB(6,I)=3:OB(6,4)=Z:RETURN
2206 MG=5:RETURN
2250 IF OJ=36 THEN IF CH(Z)=5 THEN PRINT T;"How?":RETURN ELSE MG=5:RETURN
2251 IF((CH(Z)=11 OR CH(Z)=7) AND OB(15,I)<>2) OR CH(Z)=3 THEN PRINT T;"It's not locked":RETURN
2252 OC=24:GOSUB 300:IF OF=Z THEN PRINT T;"With what?":RETURN
2254 IF CH(Z)<>11 THEN PRINT T;"That key doesn't fit here":RETURN
2255 IF OB(15,I)<>2 THEN PRINT T;"It's not locked":RETURN
2256 OB(15,I)=I:OB(15,2)=Z:MG=I:RETURN
2258 MG=5:RETURN
3100 DIM CH(8),LO$(16),IT(16,12),MV$(16),OB$(48),MG$(16),DE$(17),VB$(21),OB(48,5),VM(83),DD$(3)
3102 MODE 2:PRINT"Teeny Tiny Text Adventure"
3104 PRINT"     BY Tim Ekdom":PRINT"Converted to AMSTRAD CPC 2019 by SRS"
3105 FOR www=0 TO 3000:NEXT
3106 FOR N=Z TO 8:READ CH(N):NEXT
3108 FOR N=Z TO 16:READ LO$(N),MV$(N):NEXT
3110 FOR N=Z TO 16:FOR J=I TO 8:READ X:IF X=99 THEN J=9 ELSE IT(N,J)=X
3112 NEXT:NEXT
3120 CLS:PRINT:PRINT"  Rumors say that the old man had a":PRINT"million in cash when he died. But it"
3122 PRINT"wasn't in the bank. Where is it? There":PRINT"are no heirs. It's finders keepers!"
3124 PRINT"Your mission: to search his old house...";
3132 FOR N=I TO 48:READ OB(N,Z),OB(N,I),OB(N,2),OB(N,3),OB(N,4),OB(N,5):NEXT
3134 FOR N=I TO 48:READ OB$(N):NEXT
3136 FOR N=I TO 16:READ MG$(N):NEXT
3138 FOR N=Z TO 17:READ DE$(N):NEXT
3140 FOR N=I TO 21:READ VB$(N):NEXT
3141 FOR N=I TO 83:READ VM(N):NEXT
3142 FOR N=I TO 3:READ DD$(N):NEXT
3144 N$="Nothing":PRINT:PRINT "Caps Lock On?  Press RETURN";
3146 A$=INKEY$:IF A$="" THEN 3146 ELSE RETURN
3200 DATA 0,0,0,1,19,7,0,0,0
3202 DATA ROAD,N,PATH,NS,FRONT PORCH,SEW,LIVING ROOM,NW,BEDROOM,NWE,CLOSET,EU,BATH,S
3203 DATA KITCHEN,SD,ATTIC,D,CELLAR,U,EAST SIDE,NS,BACK SIDE,EW,WEST SIDE,NS
3204 DATA S.E. CORNER,NW,N.E. CORNER,SW,N.W. CORNER,SE,S.W. CORNER,NE
3205 DATA 22,29,45,99,22,45,23,99,15,47,99,4,13,17,15,99,2,8,99,10,36,41,99,43,44,99
3206 DATA 12,21,39,42,41,15,99,5,41,99,38,48,41,99,18,1,99,15,99,99,99,99,99,99
3211 DATA 19,0,0,0,0,0,4,3,0,0,31,0,3,0,0,4,0,0,3,3,0,0,3,0
3215 DATA 19,1,0,0,28,0,19,1,25,0,32,1,19,3,0,0,46,0,4,1,37,0,40,2
3219 DATA 3,3,0,0,20,3,19,0,0,0,0,0,3,0,0,13,0,14,7,1,0,0,25,0
3223 DATA 3,1,0,0,11,0,5,0,0,0,0,0,11,2,24,0,0,0,21,0,0,0,0,0
3227 DATA 3,3,0,0,0,16,19,0,0,0,0,0,19,0,0,0,0,7,3,3,0,0,6,0
3231 DATA 7,1,0,0,35,0,0,0,0,0,0,17,1,0,0,0,0,0,19,0,0,29,0,0
3235 DATA 19,0,0,12,0,0,9,0,0,38,0,8,11,2,24,0,0,0,19,0,0,5,0,9
3239 DATA 0,1,0,0,24,0,7,0,0,42,0,0,4,0,0,0,0,6,3,0,0,6,0,13
3243 DATA 19,3,0,36,0,0,19,0,0,31,0,11,19,3,0,0,0,0,5,2,0,0,33,4
3247 DATA 19,0,0,48,0,0,9,3,0,0,26,0,7,3,0,0,0,0,19,0,0,8,0,15
3251 DATA 7,0,0,0,0,0,7,3,0,0,30,0,6,1,0,0,0,0,6,3,0,0,46,0
3255 DATA 0,0,0,0,0,0,6,0,0,0,0,10,2,0,0,0,0,12,9,3,0,0,37,0
3298 DATA AX,BED,BOOKS,BOOKSHELF,BOX,BUNDLE,CANTEEN,CHEST,CHIMNEY,COAT,COMPUTER,CUPBOARD,DESK,DIAL
3300 DATA DOOR,FIRE,FIREPLACE,FIREWOOD,FLASHLIGHT,FLUE,FRIDGE,GATE,HOUSE,KEY,KNIFE,LANTERN,LOCK
3302 DATA MAGAZINES,MAILBOX,MATCHES,MATTRESS,MONEY,MONEYBAG,PAPER,POT,SAFE,SCREWDRIVER,SHELF
3304 DATA SINK,SOX,STAIRS,STOVE,TOILET,TUB,WALL,WATER,WINDOW,WORKBENCH
3306 DATA OK,It's closed,It's locked,It's empty,It's not here,You don't have it
3307 DATA You can't see it,You can't go that way,You can't take it,You already have it
3308 DATA I don't understand,You can't do that,It's too dark to see,The gate is shut,With what?,It's open
3310 DATA It looks uninteresting,It's a heavy nylon bag,The drawer is stuck,The flue is blocked
3312 DATA It has a numbered dial,It has a mattress,There's something underneath,The batteries are weak,It's full
3314 DATA Portable 100 back issues,It's wet,There's writing on it,It's boarded up,It's scattered all over
3315 DATA It's not a portable,Phew!!,It has a large chimney,"It's padlocked, but not too high"
3320 DATA LOOK,LIST,TAKE,DROP,EXAMINE,OPEN,CHOP,CUT,CLIMB,DRINK,FILL,LIFT
3322 DATA LIGHT,POUR,QUIT,READ,THROW,TURN,WEAR,UNLOCK,WHERE
3324 DATA 0,0,22,22,0,41,0,55,57,60,62,66,68,60,0,71,22,75,77,79,0
3326 DATA 1,3,5,6,7,10,18,19,24,25,26,28,30,33,34,35,37,40,0,5,6,7,8,12,13,15,21,27,29,33,36,43,0
3328 DATA 6,0,22,41,0,46,0,7,33,35,0,31,0,16,26,0,3,28,34,0,14,0,10,0,15,27,36,0,0
3330 DATA smoke inhalation,dehydration,hypothermia