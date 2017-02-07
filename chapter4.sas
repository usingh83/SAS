libname mozart '/folders/myfolders';

data mozart.test_scores;
length ID $ 3 Name $ 15;
input ID $ Score1-Score3 Name $;
datalines;
1 90 95 98 Milton
2 78 77 75 Washington
3 88 91 92 Smith
;

title "The Descriptor Portion of Data Set TEST_SCORES";
proc contents data=Mozart.test_scores;
run;

title "The Descriptor Portion of Data Set TEST_SCORES";
proc contents data=Mozart.test_scores varnum;
run;

title "Listing All the SAS Data Sets in a Library";
proc contents data=Mozart._all_ nods;
run;

data new;
set  mozart.test_scores;
AveScore = mean(of score1-score3);
run;

title "Listing of Data Set NEW";
proc print data=new;
var ID Score1-Score3 AveScore;
run;


data new;
set mozart.test_scores;
AveScore = mean(of score1-score3);
run;
title "Listing of Data Set NEW";
proc print data=new;
var ID Score1-Score3 AveScore;
run;


data _null_;
set mozart.test_scores;
if score1 ge 95 or score2 ge 95 or score3 ge 95 then
put ID= Score1= Score2= Score3=;
run;

*1;
libname learn '/folders/myfolders';
data learn.perm;
input ID : $3. Gender : $1. DOB : mmddyy10.
Height Weight;
label DOB = 'Date of Birth'
Height = 'Height in inches'
Weight = 'Weight in pounds';
format DOB date9.;
datalines;
001 M 10/21/1946 68 150
002 F 5/26/1950 63 122
003 M 5/11/1981 72 175
004 M 7/4/1983 70 128
005 F 12/25/2005 30 40
;
*2;

proc print data=learn.perm;
run;

*3;

* Write your LIBNAME statement here;
data Survey2007;
input Age Gender $ (Ques1-Ques5)($1.);
/* See Chapter 21, Section 14 for a discussion
of variable lists and format lists used above */
datalines;
23 M 15243
30 F 11123
42 M 23555
48 F 55541
55 F 42232
62 F 33333
68 M 44122
;
* Write your libname statement here;
proc means data= work.survey2007;
var Age;
run;

