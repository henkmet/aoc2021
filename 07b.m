#!/usr/bin/octave -qf
fid=fopen('07.txt', 'r');
data=csvread(fid);
fclose(fid);
lowball=floor(mean(data)-0.5);
lowb=0.5*(sum((lowball-data).^2+abs(lowball-data)));
highball=ceil(mean(data)-0.5);
highb=0.5*(sum((highball-data).^2+abs(highball-data)));
fprintf('The crabs must spend either %d or %d fuel.\n', lowb, highb);
