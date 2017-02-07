*1;

data Dates;
input subject $3
	  dob mmddyy8.
	  visit_date date9.;
format dob date9.
	  visit_date date9.;
datalines;
0011021195011Nov2006
0020102195525May2005
0031225200525Dec2006
;

*2;

data ThreeDates;
input Date1 : mmddyy10.
	  Date2 : mmddyy10.
	  Date3 : date9.;
format Date1  mmddyy10.
	  Date2  mmddyy10.
	  Date3  mmddyy10.;
Year12=round(yrdif(Date1,Date2,'Actual'));
Year23=round(yrdif(Date2,Date3,'Actual'));
datalines;
01/03/1950 01/03/1960 03Jan1970
05/15/2000   05/15/2002   15May2003
10/10/1998 11/12/2000    25Dec2005
;
run;

*3;
option yearcutoff=1910;
data Dates1910_2006;
input date mmddyy8.;
format date mmddyy10.;
datalines;
01/01/11
02/23/05
03/15/15
05/09/06
;
run;



