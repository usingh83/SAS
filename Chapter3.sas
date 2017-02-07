data financial;
infile '/folders/myfolders/bank.txt';
input Subj $ 1-3
DOB $ 4-13
Gender $ 14
Balance 16-21;
run;

data financial;
infile '/folders/myfolders/bank.txt';
input @1 Subj $3.
@4 DOB mmddyy10.
@14 Gender $1.
@15 Balance 7.;
run;

proc print data=financial;
format DOB mmddyy10.
		Balance COMMA11.2;
run;

data list_example;
infile '/folders/myfolders/list.csv' dsd;
input Subj : $3.
Name : $20.
DOB : mmddyy10.
Salary : dollar8.;
format DOB date9. Salary dollar8.;
run;

data list_example;
informat Subj $3.
Name $20.
DOB mmddyy10.
Salary dollar8.;
infile '/folders/myfolders/list.csv' dsd;
input Subj
Name
DOB
Salary;
format DOB date9. Salary dollar8.;
run;

data list_example;
infile '/folders/myfolders/list.txt';
input Subj : $3.
Name & $20.
DOB : mmddyy10.
Salary : dollar8.;
format DOB date9. Salary dollar8.;
run;

*Problems Solution;
*1;
data score;
infile "/folders/myfolders/scores.txt";
input gender$1. English history math science;
avg=(English+history+math+science)/4;
run;

proc print data=work.score;
run;
*2;
data Vote;
infile "/folders/myfolders/political.csv" dsd;
input State$ Party$ Age;
run;

proc print data=work.vote;
run;

proc freq data=work.vote;
table Party;
run;

*3;

data Company;
infile "/folders/myfolders/company.txt" dsd delimiter="$";
input LastName $ EmpNo $ Salary;
run;

*4;
filename temp1 "/folders/myfolders/political.csv";
data Vote1;
infile temp1 dsd;
input State$ Party$ Age;
run;

*5;
data x_y;
input x y;
z=100+50*x+2*x**2-(25*y)+(y**2);
datalines;
1 2
3 6 
5 9
9 11
;
run;

*6;

data bankdata;
infile "/folders/myfolders/bankdata.txt";
input  Name & $20.
		Acct : $5.
		Balance 21-26
		Rate 27-30;
Interest=Balance*Rate;
run;

proc print data=work.bankdata;
format Balance dollar11.2
Interest dollar11.2;
run;

*7;
data Cache;
infile "/folders/myfolders/geocaching.txt" delimiter=".";
input Name & $20.
		LongDeg  21-22
		LongMin  23-28
		LatDeg	29-30
		LatMin 31-36;
run;

*8;

data bankdata1;
infile "/folders/myfolders/bankdata.txt";
input @1 Name & $15.
	  @16 Acct : $5.
	  @21 Balance 6.
	  @27	Rate 3.;
Interest=Balance*Rate;
run;

proc print data=work.bankdata1;
format Balance dollar11.2
Interest dollar11.2;
run;

*9;


data Cache;
infile "/folders/myfolders/geocaching.txt" delimiter=".";
input @1 Name & $20.
	  @21 LongDeg  2.
	  @23 LongMin  6.
	  @29 LatDeg   2.
	  @31 LatMin 6.;
run;

*10;
data Stocks;
infile "/folders/myfolders/stockprices.txt";
input @1 Stock $4.
	  @5 PurDate mmddyy10.
	  @15 PurPrice dollar5.1
	  @21 Number 4.
	  @25 SellDate mmddyy10.
	  @35 SellPrice dollar5.1;
TotalPur=Number*PurPrice;
TotalSell=Number*SellPrice;
Profit=TotalSell-TotalPur;
format PurDate SellDate  mmddyy10.
	   PurPrice SellPrice dollar5.1;
run;

proc print data=work.stocks;
run;

*11;

data Employ;
infile "/folders/myfolders/employee.csv" dsd;
informat ID $3. Name $20. Depart $8. DateHire mmddyy10. Salary dollar8.;
input ID Name Depart DateHire Salary;
format DateHire mmddyy10.;
run;

proc print data=work.employ;
run;