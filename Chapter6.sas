*1;
libname readit 'c:\books\learning\wages.xls';

title "Statistics from Sales Spreadsheet";
proc means data=readit.'Permanent$'n mean;
var Wage Hours_Worked;
run;

proc print data=work.drugtest;
run;

*2;

data soccer;
input Team : $20. Wins Losses;
datalines;
Readington 20 3
Raritan 10 10
Branchburg 3 18
Somerville 5 18
;
options nodate nonumber;
title;
ods listing close;
ods csv file='/folders/myfolders/soccer.csv';
proc print data=soccer noobs;
run;
ods csv close;
ods listing;


libname readit '/folders/myfolders/soccer.xls';
proc print data=readit.'soccer$'n noobs;
run;
