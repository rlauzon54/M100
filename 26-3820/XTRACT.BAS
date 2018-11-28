10 'XTRACT.BA: Data Extraction Program
20 'Copyright 1983 by Tandy Corp. All rights reserved.
30 MAXFILES=2:CLEAR 500
40 FILES:LINEINPUT"Name of input file? ";FI$:LINEINPUT"Name of output file? ";FO$:IF FI$=""THEN END ELSE IF FO$=""THEN FO$="LCD:"
50 ONERROR GOTO 60:OPEN FI$ FOR INPUT AS 1:OPEN FO$ FOR OUTPUT AS 2:ONERROR GOTO 0    :GOTO 70
60 BEEP:PRINT"Can't open file due to error"ERR:RESUME 40
70 LINE INPUT "Enter character(s) to search for ";C$:IF C$=""THEN CLOSE:END
80 SC=0:EC=0:PRINT"Enter starting and ending columns":PRINT"for search (0=entire record)";:INPUT SC,EC
90 IF SC=0 AND EC=0 THEN SC=1:EC=255:GOTO 110
100 IF SC<1 OR SC>EC OR EC>255 THEN BEEP:PRINT"Error in column specification":GOTO 80
110 IF EOF(1) THEN PRINT"End of file.":CLOSE:END
120 LINE INPUT #1,TX$
130 IF TX$="" THEN 110
140 ST$=MID$(TX$,SC,EC-SC+1)
150 IF INSTR(1,ST$,C$)=0 THEN 110
160 PRINT#2,TX$;:IF LEN(TX$)<255 THEN PRINT#2,
170 GOTO 110
