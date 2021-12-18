#!/usr/bin/octave
fid=fopen('09.txt', 'r');
data=textscan(fid, '%s');
fclose(fid);
elem=zeros(100,100);
for i=1:length(data{1})
  for j=1:length(data{1}{i})
    elem(i,j)=str2num(data{1}{i}(j));
  endfor
endfor
mask=ones(size(elem));
test=10*ones(size(elem));
test(:,2:100)=elem(:,1:99);
mask=mask.*max(sign(test-elem),0);
test=10*ones(size(elem));
test(:,1:99)=elem(:,2:100);
mask=mask.*max(sign(test-elem),0);
test=10*ones(size(elem));
test(1:99,:)=elem(2:100,:);
mask=mask.*max(sign(test-elem),0);
test=10*ones(size(elem));
test(2:100,:)=elem(1:99,:);
mask=mask.*max(sign(test-elem),0);
answer=sum(mask(:).*elem(:))+sum(mask(:));
printf('The sum of the low points is %d\n', answer)
