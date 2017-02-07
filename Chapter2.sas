data Portfolio;
	infile "/folders/myfolders/stocks.txt";
	input stock_symbol$ price number_of_shares;
	Value=price*number_of_shares;
run;

proc means data=work.portfolio;
	var price value;
run;

data prob2;
input ID $
Height /* in inches */
Weight /* in pounds */
SBP /* systolic BP */
DBP /* diastolic BP */;
wtkg=Weight/2.2;
HtCm=Height/2.54;
AveBP=DBP+(SBP -DBP)/3;
HtPolynomial=2*Height**2+1.5*Height**3;
datalines;
001 68 150 110 70
002 73 240 150 90
003 62 101 120 80
;
title "Listing of PROB2";
proc print data=prob2;
run;