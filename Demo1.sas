Data new;
input name$ age gender$;
cards;
a 21 m
b 23 f
c 24 m
f 25 f
d 18 f
run;

proc print data=new;
run;

proc contents data=new;
run;