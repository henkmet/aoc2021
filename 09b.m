#!/usr/bin/octave
function retval=recfun(i,j,area)
  global elem;
  retval=area;
  if (elem(i,j)!=9)
    elem(i,j)=9;
    retval+=1;
    if (i<100)
      retval+=recfun(i+1,j,area);
    endif
    if (j<100)
      retval+=recfun(i,j+1,area);
    endif
    if (j>1)
      retval+=recfun(i,j-1,area);
    endif
    if (i>1)
      retval+=recfun(i-1,j,area);
    endif
  endif
endfunction

fid=fopen('09.txt', 'r');
data=textscan(fid, '%s');
fclose(fid);
elem=zeros(100,100);
for i=1:length(data{1})
  for j=1:length(data{1}{i})
    elem(i,j)=str2num(data{1}{i}(j));
  endfor
endfor
k=1;
area=0;
global elem;
for i=1:100
  for j=1:100
    if (elem(i,j)!=9)
      area(k)=recfun(i,j,0);
      k+=1;
    endif
  endfor
endfor
area=sort(area,"descend");
answer=area(1)*area(2)*area(3);
printf('The product of the largest three areas is %d\n', answer);
