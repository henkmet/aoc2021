#!/usr/bin/octave -qf
[digits{1:14}] = textread('08.txt', "%s %s %s %s %s %s %s %s %s %s |%s %s %s %s", 'delimiter', ' \n');
easydigits=0;
for col=11:14 easydigits = easydigits + sum(cellfun("length", digits{col})==2) + sum(cellfun("length", digits{col})==3) + sum(cellfun("length", digits{col})==4) + sum(cellfun("length", digits{col})==7); endfor
fprintf('The number of easy digits is %d\n', easydigits);
