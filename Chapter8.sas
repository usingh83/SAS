data grades;
length Gender $ 1
Quiz $ 2
AgeGrp $ 13;
infile '/folders/myfolders/grades.txt' missover;
input Age Gender Midterm Quiz FinalExam;
if missing(Age) then delete;
if Age le 39 then Agegrp = 'Younger group';
if Age le 39 then Grade = .4*Midterm + .6*FinalExam;
if Age gt 39 then Agegrp = 'Older group';
if Age gt 39 then Grade = (Midterm + FinalExam)/2;
run;
title "Listing of GRADES";
proc print data=grades noobs;
run;

data revenue;
retain Total 0;
input Day : $3.
Revenue : dollar6.;
if not missing(Revenue) then Total = Total + Revenue;
format Revenue Total dollar8.;
datalines;
Mon $1,000
Tue $1,500
Wed .
Thu $2,000
Fri $3,000
;



data revenue;
input Day : $3.
Revenue : dollar6.;
Total + Revenue;
format Revenue Total dollar8.;
datalines;
Mon $1,000
Tue $1,500
Wed .
Thu $2,000
Fri $3,000
;



data test;
input x;
if missing(x) then MissCounter + 1;
datalines;
2
.
7
.
;

data table;
do n = 1 to 10;
Square = n*n;
SquareRoot = sqrt(n);
output;
end;
run;
title "Table of Squares and Square Roots";
proc print data=table noobs;
run;

data equation;
do X = -10 to 10 by .01;
Y = 2*x**3-5*X**2+15*X-8;
output;
end;
run;
symbol value=none interpol=sm width=2;
title "Plot of Y versus X";
proc sgplot data=equation;
scatter x=X y=Y;
run;

*1;

data vitals;
input ID : $3.
Age
Pulse
SBP
DBP;
label SBP = "Systolic Blood Pressure"
DBP = "Diastolic Blood Pressure";
datalines;
001 23 68 120 80
002 55 72 188 96
003 78 82 200 100
004 18 58 110 70
005 43 52 120 82
006 37 74 150 98
007 . 82 140 100
;

data NewVitals;
set vitals;
if Age lt 50 and not missing(Age) then do;
	if Pulse lt 70 then PulseGroup='low';
	else PulseGroup='High';
	if SBP lt 130 then SBPGroup='low';
	else SBPGroup='High';
end;
else if Age ge 50 then do;
	if Pulse lt 74 then PulseGroup='low';
	else PulseGroup='High';
	if SBP lt 140 then SBPGroup='low';
	else SBPGroup='High';
end;
RUN;

*2;

data monthsales;
input month sales @@;
SumSales+sales;
output;
datalines;
1 4000 2 5000 3 . 4 5500 5 5000 6 6000 7 6500 8 4500
9 5100 10 5700 11 6500 12 7500
;

*3;

data test;
input Score1-Score3;
Subj+1;
datalines;
90 88 92
75 76 88
88 82 91
72 68 70
;

*5;

data good;
do n=1 to 20;
	logn=log(n);
	output;
end;
run;

*6;

data good1;
do n=5 to 100 by 5;
	logn=log(n);
	output;
end;
run;

	

