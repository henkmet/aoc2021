#!/usr/bin/octave -qf
t=cputime();
fid=fopen('06.txt', 'r');
data = csvread(fid);
fclose(fid);
y=zeros(1,9);
days=input("Number of days (80/256) ");
for i=1:9 y(i)=sum(data==i-1); endfor # octave starts indexing at 1
for i=1:days
        y(10)=y(1);
        y(1:9) = y(2:10);
        y(7) = y(7)+y(9);
        y(10)=[];
endfor
fprintf('The final number of lanternfish after %d days is %d\n', days, sum(y));
fprintf('This took %d seconds\n', cputime()-t);
