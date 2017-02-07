libname learn '/folders/myfolders/learning';

data learn.test_scores;
length ID $ 3 Name $ 15;
input ID $ Score1-Score3;
label ID = 'Student ID'
Score1 = 'Math Score'
Score2 = 'Science Score'
Score3 = 'English Score';
datalines;
1 90 95 98
2 78 77 75
3 88 91 92
;


*1;
libname myfmts '/folders/myfolders/formats';

proc format library=myfmts;
value age 0-30="0-30"
		  31-50="31–50"
		  51-70="51–70"
		  71-high="71+";
value  $Party 'D' = "Democrat"
	  		 'R' = "Republican";
value  $Ques '1'="Strongly Disagree"
	  	   '2'="Disagree"
	  	   '3'="NoOpinion"
	  	   '4'="Agree"
	  	   '5'="Strongly Agree";
run;


data voter;
input Age Party : $1. (Ques1-Ques4)($1. + 1);
label Ques1="The president is doing a good job"
	  Ques2="Congress is doing a good job"
	  Ques3="Taxes are too high"
	  Ques4="Government should cut spending";
format Age age.
	   Party $Party.
	   Ques1-Ques4 Ques.;
datalines;
23 D 1 1 2 2
45 R 5 5 4 1
67 D 2 4 3 3
39 R 4 4 4 4
19 D 2 1 2 1
75 D 3 3 2 3
57 R 4 3 4 4
;

*2;
proc format library=myfmts;
value $three "1","2"="Generally Disagree"
			 "3"="No Opinion"
			 "4","5"="Generally Agree";
run;

proc freq data=work.voter;
format Ques1-Ques4 $three.;
tables Ques1-Ques4;
run;

*3;


data colors;
input Color : $1. @@;
datalines;
R R B G Y Y . . B G R B G Y P O O V V B
;

proc format library=myfmts;
value $colors 'R','B','G'="Group 1"
	  		  'Y','O'="Group 2"
	   		  ' '="Not Given"
	   		  other="Group 3";
run;

proc freq data=colors;
format Color $colors.;
table Color;
run;

*4;

libname myfmts '/folders/myfolders/formats';

proc format library=myfmts;
value age 0-30="0-30"
		  31-50="31–50"
		  51-70="51–70"
		  71-high="71+";
value  $Party 'D' = "Democrat"
	  		 'R' = "Republican";
value  $Ques '1'="Strongly Disagree"
	  	   '2'="Disagree"
	  	   '3'="NoOpinion"
	  	   '4'="Agree"
	  	   '5'="Strongly Agree";
run;

libname learn '/folders/myfolders';

data learn.voter;
input Age Party : $1. (Ques1-Ques4)($1. + 1);
label Ques1="The president is doing a good job"
	  Ques2="Congress is doing a good job"
	  Ques3="Taxes are too high"
	  Ques4="Government should cut spending";
format Age age.
	   Party $Party.
	   Ques1-Ques4 Ques.;
datalines;
23 D 1 1 2 2
45 R 5 5 4 1
67 D 2 4 3 3
39 R 4 4 4 4
19 D 2 1 2 1
75 D 3 3 2 3
57 R 4 3 4 4
;


*5;

proc format library=myfmts;
value YESNO 1='Yes'
			0='No';
value $YESNO 'Y'='Yes'
			 'N'='No';
value $Gender 'M'='Male'
			  'F'='Female';
value age20yr low-20=1
			  21-40=2
			  41-60=3
			  61-80=4
			  81-high=5;
run;

proc format library=myfmts;
select YESNO $YESNO $Gender age20yr;
run;