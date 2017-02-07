libname clinic '/folders/myfolders';

proc print data=clinic.admit;
run; 

proc contents data=clinic._all_ nods;
run;

proc contents data=clinic.admit;
run;

proc datasets;
contents data=clinic._all_ nods;
quit;

proc datasets;
contents data=clinic.admit varnum;
quit;

proc contents data=clinic.admit varnum;
run;

options nonumber nodate;
proc print data=clinic.admit;
var id sex age height weight;
where age>=30;
run;

options date;
proc freq data=clinic.admit;
where age>=30;
tables sex;
run;

options nodate pageno=3;
proc print data=clinic.admit;
run;

options pageno=1 pagesize=15;
proc print data=clinic.admit;
run;

options pageno=1 linesize=64;
proc print data=clinic.admit;
run;

options firstobs=10;
proc print data=clinic.admit;
run;

options firstobs=1 obs=10;
proc print data=clinic.admit;
run;

options obs=max;

proc options;
run;

proc options option=yearcutoff;
run;

