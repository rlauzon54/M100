10 'SIZER.BA: Character and Word Count Program
20 'Copyright 1983 by Tandy Corp. All rights reserved.
30 MAXFILES=1
40 DEFINT A-Z
50 FILES
60 LINE INPUT "Document name? ";FI$
70 NC=0: NW=0
80 W=1: D=0
90 S2=D
100 WD$=CHR$(9)+CHR$(10)+CHR$(13)+CHR$(32)+"-"+"."+"/"
110 OPEN FI$ FOR INPUT AS 1
120 S1=S2
130 IF EOF(1) THEN GOSUB 210: GOTO 180
140 C$=INPUT$(1,1)
150 NC=NC+1
160 IF INSTR(1,WD$,C$)=0 THEN S2=W: GOTO 120
170 GOSUB 210: GOTO 120
180 CLOSE
190 PRINT FI$ " contains" NC "characters": PRINT "and" NW "words."
200 END
210 S2=D: IF S1=W THEN NW=NW+1
220 RETURN
