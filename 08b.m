#!/usr/bin/octave -qf
[digits{1:14}] = textread('08.txt', "%s %s %s %s %s %s %s %s %s %s |%s %s %s %s", 'delimiter', ' \n');
answer=0;
for i=1:length(digits{1})
  count=zeros(1,7);
  for j=1:10
    for k=1:length(digits{j}{i})
      count(double(digits{j}{i}(k))-96)++;
    endfor      
  endfor
  for j=11:14
    score=0;
    for k=1:length(digits{j}{i})
      score=score+count(double(digits{j}{i}(k))-96);
    endfor
    k=10^(14-j);
    switch (score)
      case 42 l=0;
      case 17 l=1;
      case 34 l=2;
      case 39 l=3;
      case 30 l=4;
      case 37 l=5;
      case 41 l=6;
      case 25 l=7;
      case 49 l=8;
      case 45 l=9;
      otherwise fprintf('That wasnt supposed to happen %d\n', score);
    endswitch
    answer=answer+k*l;
  endfor
endfor
fprintf('The total of the output values is %d\n', answer);
