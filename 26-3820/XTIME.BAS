10 'XTIME.BA: Telecommunication Cost Estimator
20 'Copyright 1983 by Tandy Corp. All rights reserved.
30  PRINT "Telecomm time and cost estimator":PRINT
40 INPUT "Document length (1-29905)"; L
50 IF L<1 OR L>29905 THEN 40
60 INPUT "Info rate in bps (300,600,1200)";IR
70 IF IR<>300 AND IR <>600 AND IR<>1200 THEN 60
80 IM=IR*60
90 INPUT "Data word length (7 OR 8)";DW
100 IF DW<>7 AND DW<>8 THEN 90
110 INPUT "Parity (E/O/I/N)"; P$
120 IF P$="E" OR P$="O" OR P$="I" THEN PB=1: GOTO 150
130 IF P$="N" THEN PB=0: GOTO 150
140 GOTO 110
150 INPUT "Stop bits (1,2)"; SB
160 IF SB<>1 AND SB<>2 THEN 150
170 PRINT "Host computer's hourly rate":INPUT "(0-99.99)";HR
180 PRINT"Network surcharge per minute":INPUT"(0-9.99)";NM
190 IF NM<0 OR NM>9.99 THEN 180
200 IF HR<0 OR HR>99.99 THEN 170
210 HM=HR/60
220 PRINT "Phone system's minute rate": INPUT "(0-9.99)";TM
230 IF TM<0 OR TM>9.99 THEN 220
240 T=-INT(-L*(1+DW+PB+SB)/IM)
250 C=T*(HM+TM+NM)
260 PRINT "The file transfer will take at least"
270 PRINT USING "## minutes and cost at least $$###.##."; T;C
