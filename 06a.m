#!/usr/bin/octave -qf
fid=fopen('06.txt', 'r');
data = csvread(fid);
fclose(fid);
y=zeros(1,9);
days=input("Number of days (80/256)");
for i=1:9 y(i)=sum(data==i-1); endfor # octave starts indexing at 1
for i=1:days
        ytemp(1:8)=y(2:9);
        ytemp(7) = ytemp(7)+y(1);
        ytemp(9) = y(1);
        y=ytemp;
endfor
fprintf('The final number of lanternfish after %d days is %d\n', days, sum(y));
