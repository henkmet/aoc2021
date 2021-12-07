#!/usr/bin/octave -qf
fid=fopen('07.txt', 'r');
data=csvread(fid);
fclose(fid);
fprintf('The crabs must spend %d fuel.\n', sum(abs(data-median(data))));
