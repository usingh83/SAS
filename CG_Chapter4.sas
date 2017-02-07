libname clinic '/folders/myfolders';
proc print data=clinic.admit;
run;

proc print data=clinic.admit;
sum fee;
run;

proc sort data=clinic.admit out=admit;
by age;
run;

proc print data=admit label;
var age height weight fee;
label fee='Admission Fee';
run;

proc print data=clinic.admit noobs;
var age height weight fee;
where age>30;
run;

libname patients "/folders/myfolders";
Data patients.therapy;
input Obs Date$ AerClass WalkJogRun Swim;
datalines;
1 JAN1999 56 78 14
2 FEB1999 32 109 19
3 MAR1999 35 106 22
4 APR1999 47 115 24
5 MAY1999 55 121 31
6 JUN1999 61 114 67
7 JUL1999 67 102 72
8 AUG1999 64 76 77
9 SEP1999 78 77 54
10 OCT1999 81 62 47
11 NOV1999 84 31 52
12 DEC1999 2 44 55
13 JAN2000 37 91 83
14 FEB2000 41 102 27
15 MAR2000 52 98 19
16 APR2000 61 118 22
17 MAY2000 49 88 29
18 JUN2000 24 101 54
19 JUL2000 45 91 69
20 AUG2000 63 65 53
21 SEP2000 60 49 68
22 OCT2000 78 70 41
23 NOV2000 82 44 58
24 DEC2000 93 57 47
;

proc print data=patients.admit noobs;
var age height weight fee;
run;

libname sales "/folders/myfolders";
Data sales.reps;
INPUT IDnum LastName$ FirstName$ City$ State$ Sex$ JobCode$ Salary Birth date7. Hired date8. HomePhone $12.0;
format Birth date9. Hired date9.;
DATALINES;
1269 CASTON FRANKLIN STAMFORD CT M NA1 41690.00 06MAY60 01DEC80 203/781-3335
1935 FERNANDEZ KATRINA BRIDGEPORT CT , NA2 51081.00 31MAR42 19OCT69 203/675-2962
1417 NEWKIRK WILLIAM PATERSON NJ , NA2 52270.00 30JUN52 10MAR77 201/732-6611
1839 NORRIS DIANE NEWYORK NY F NA1 43433.00 02DEC58 06JUL81 718/384-1767
1111 RHODES JEREMY PRINCETON NJ M NA1 40586.00 17JUL61 03NOV80 201/812-1837
1352 RIVERS SIMON NEWYORK NY M NA2 5379.80 05DEC48 19OCT74 718/383-3345
1332 STEPHENSON ADAM BRIDGEPORT CT M NA1 42178.00 20SEP58 07JUN79 203/675-1497
1443 WELLS AGNES STAMFORD CT F NA1 422.74 20NOV56 01SEP79 203/781-5546
;



proc print data=sales.reps;
id idnum lastname;
run;

proc sort data=clinic.admit out=work.activity;
by actlevel;
run;

proc print data=work.activity;
var age height weight fee;
where age>30;
sum fee;
by actlevel;
run;

proc sort data=clinic.admit out=work.activity;
by actlevel;
run;

proc print data=work.activity;
var age height weight fee;
where age>30;
sum fee;
by actlevel;
id actlevel;
run;

proc sort data=clinic.admit out=work.activity;
by actlevel;
run;

proc print data=work.activity;
var age height weight fee;
where age>30;
sum fee;
by actlevel;
id actlevel;
pageby actlevel;
run;

title1 'Heart Rates for Patients with';
title3 'Increased Stress Tolerance Levels';
proc print data=clinic.admit;
var age height weight fee;
where age>30;
run;


footnote1 'Data from Treadmill Tests';
footnote3 '1st Quarter Admissions';
proc print data=clinic.admit;
var age height weight fee;
where age>30;
run;
proc tabulate data=clinic.admit;
where age>30;
var age height weight fee;
table mean*(age height weight fee);
run;

title3 'Participation in Exercise Therapy';
proc print data=clinic.therapy;
var swim walkjogrun aerclass;
run;
title2 'Report for March';
proc print data=clinic.therapy;
run;

title1;
footnote1 'Data from Treadmill Tests';
footnote3 '1st Quarter Admissions';
proc print data=clinic.admit;
var age height weight fee;
where age>30;
run;
footnote;
proc tabulate data=clinic.admit;
where age>30;
var age height weight fee;
table mean*(age height weight fee);
run;

proc print data=clinic.therapy label;
label walkjogrun='Walk/Jog/Run';
run;

proc print data=clinic.admit label;
var actlevel height weight;
label actlevel='Activity Level'
height='Height in Inches'
weight='Weight in Pounds';
run;

proc print data=clinic.admit;
var actlevel fee;
where actlevel='HIGH';
format fee dollar4.;
run;

data clinic.mar01;
input Obs Date date9. Dest$ Boarded;
format Date date9.;
datalines;
1 01MAR2000 LON 198
2 01MAR2000 PAR 207
3 01MAR2000 LON 205
4 01MAR2000 COP 138
5 01MAR2000 MUN 147
;

data clinic.march;
set clinic.mar01;
label date='Departure Date';
format date date9.;
run;
proc print data=clinic.march label;
run;

proc print data=clinic.march split='*';
var Obs Date Dest Boarded;
label Dest='Sales*Representative';
run;

proc format;
value obsfmt
1,2='Bynum'
3='Crowley'
4,5='King';
proc print data=clinic.march;
var Obs Date Dest Boarded;
format Obs obsfmt.;
run;



