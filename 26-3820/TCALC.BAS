10 'TCALC.BA: Data File Calculator Program
20 'Copyright 1983 by Tandy Corp. All rights reserved.
30 MAXFILES=1:CLEAR 1000:DEFINT A-Z:CR$=CHR$(13):CM$=",":QT$=CHR$(34):NL$=CR$+CHR$(10)
40 FILES:LINE INPUT"Name of input file? ";FI$
50 OPEN FI$ FOR INPUT AS 1
60 IF EOF(1) THEN BEEP:PRINT"Empty file":CLOSE:END
70 LINE INPUT #1,SL$:CLOSE:IF LEN(SL$)=255 THEN BEEP:PRINT"Record exceeds maximum length of 254."NL$"Check file format.":END
80 PRINT"Analyzing a sample row.":NF=1:QF=0:I=0
90 I=I+1:IF I>LEN(SL$) THEN160
100 C$=MID$(SL$,I,1):ON INSTR(1,CM$+QT$,C$) GOTO 120,140
110 GOTO 90
120 IF QF=0 THEN NF=NF+1
130 GOTO 90
140 QF=QF XOR 1
150 GOTO 90
160 DIM CF(NF):PRINT"The sample row contains"NF"columns."
170 PRINT"The sample column entries are"
180 OPEN FI$ FOR INPUT AS 1
190 FOR I=1 TO NF:INPUT#1,F$:PRINT I"- "QT$F$QT$:NEXT I:CLOSE
200 PRINT"Agreed (Y/N)?";:YN$=INPUT$(1):PRINT:ON INSTR(1,"YyNn",YN$)/2+.5 GOTO 230,220
210 GOTO 200
220 PRINT"Can't continue. Check record format.":END
230 PRINT"Compute <R>ow or <C>olumn totals? ";
240 RC$=INPUT$(1):ON INSTR(1,"RrCc",RC$)/2+.5 GOTO 280,260
250 BEEP:GOTO 240
260 PRINT:PRINT"Compute totals for which column"NL$"(0 to review)";:INPUT CN:IF CN<1 OR CN>NF THEN 170
270 GOTO 410
280 PRINT:FOR I=1 TO NF:PRINT"Include column"I"in the total";:INPUT YN$:CF(I)=INSTR(1,"Yy",YN$)/2+.5:NEXT I
290 PRINT:OPEN FI$ FOR INPUT AS 1
300 RN=0
310 T#=0:NI=0
320 IF EOF(1) THEN CLOSE: END
330 FOR I=1 TO NF
340 IF EOF(1) THEN 510
350 INPUT #1, D$:IF CF(I)=0 THEN 370
360 T#=T#+VAL(D$):NI=NI+1
370 NEXT I
380 RN=RN+1
390 PRINT"Total of row"RN"is"T#;NL$"Average of"NI"items is"T#/NF
400 GOTO 310
410 OPEN FI$ FOR INPUT AS 1
420 T#=0:NI=0
430 IF EOF(1) THEN 490
440 FOR I=1 TO NF:IF EOF(1) THEN 510
450 INPUT #1,D$
460 IF I=CN THEN T#=T#+VAL(D$):NI=NI+1
470 NEXT I
480 GOTO 430
490 PRINT"Total of column"CN"is"T#;NL$"Average of"NI"items is"T#/NI
500 CLOSE:END
510 BEEP:PRINT"Reached end of file in the middle"NL$"of a record.":CLOSE:END
