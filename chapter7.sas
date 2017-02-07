*1;
data school;
input Age Quiz : $1. Midterm Final;
if Age=12 then grade=6;
else if Age=13 then grade=8;
if Quiz='A' then Course=95*0.2+Midterm*0.3+Final*0.5;
else if Quiz='B' then Course=85*0.2+Midterm*0.3+Final*0.5;
else if Quiz='C' then Course=75*0.2+Midterm*0.3+Final*0.5;
else if Quiz='D' then Course=70*0.2+Midterm*0.3+Final*0.5;
else if Quiz='F' then Course=65*0.2+Midterm*0.3+Final*0.5;
datalines;
12 A 92 95
12 B 88 88
13 C 78 75
13 A 92 93
12 F 55 62
13 B 88 82
;

