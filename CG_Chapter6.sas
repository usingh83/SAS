
data _null_;
infile '/folders/myfolders/bank.txt';
input Subj $ 1-3
DOB $ 4-13
Gender $ 14
Balance 16-21;
run;