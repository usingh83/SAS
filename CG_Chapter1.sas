libname clinic '/folders/myfolders';


data clinic.admit;
input Obs ID Name$ Sex$ Age Date Height Weight ActLevel$ Fee;
datalines;
1 2458 Murray,W M 27 1 72 168 HIGH 85.20
2 2462 Almers,C F 34 3 66 152 HIGH 124.80
3 2501 Bonaventure,T F 31 17 61 123 LOW 149.75
4 2523 Johnson,R F 43 31 63 137 MOD 149.75
5 2539 LaMance,K M 51 4 71 158 LOW 124.80
6 2544 Jones,M M 29 6 76 193 HIGH 124.80
7 2552 Reberson,P F 32 9 67 151 MOD 149.75
8 2555 King,E M 35 13 70 173 MOD 149.75
9 2563 Pitts,D M 34 22 73 154 LOW 124.80
10 2568 Eberhardt,S F 49 27 64 172 LOW 124.80
11 2571 Nunnelly,A F 44 19 66 140 HIGH 149.75
12 2572 Oberon,M F 28 17 62 118 LOW 85.20
13 2574 Peterson,V M 30 6 69 147 MOD 149.75
14 2575 Quigley,M F 40 8 69 163 HIGH 124.80
15 2578 Cameron,L M 47 5 72 173 MOD 124.80
16 2579 Underwood,K M 60 22 71 191 LOW 149.75
17 2584 Takahashi,Y F 43 29 65 123 MOD 124.80
18 2586 Derber,B M 25 23 75 188 HIGH 85.20
19 2588 Ivan,H F 22 20 63 139 LOW 85.20
20 2589 Wilcox,E F 41 16 67 141 HIGH 149.75
21 2595 Warren,C M 54 7 71 183 MOD 149.75
;

data clinic.admit2;
set clinic.admit;
run;

proc print data=clinic.admit2;
run;

proc tabulate data=clinic.admit;
class sex;
var height weight;
table sex*(height weight),mean;
run;

proc copy in=clinic out=work;
select admit;
run;

