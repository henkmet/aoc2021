#!/usr/bin/octave -qf
function retval=flnb(level,i,j)
retval=0;
if (i>1&&j>1) if (level(i-1,j-1)==-10) retval+=1; endif endif
if (i>1&&j<10) if (level(i-1,j+1)==-10) retval+=1; endif endif
if (i>1) if (level(i-1,j)==-10) retval+=1; endif endif
if (j>1) if (level(i,j-1)==-10) retval+=1; endif endif
if (j<10) if (level(i,j+1)==-10) retval+=1; endif endif
if (i<10&&j>1) if (level(i+1,j-1)==-10) retval+=1; endif endif
if (i<10) if (level(i+1,j)==-10) retval+=1; endif endif
if (i<10&&j<10) if (level(i+1,j+1)==-10) retval+=1; endif endif
endfunction

data=cell2mat(textread('11.txt', "%s"));
level=zeros(10,10);
for i=1:10 for j=1:10 level(i,j)=str2num(data(i,j)); endfor endfor
flashes=0;
step=0;
success=0;
while (success==0)
  step+=1;
  level+=1;
  temp=level;
  while (sum(temp(:)>9))
    level(temp>9)=-10;
    for i=1:10
      for j=1:10
        temp(i,j)=level(i,j)+flnb(level,i,j);
      endfor
    endfor
    endwhile
    temp(temp<0)=0;
    temp(temp>9)=0;
    stepflash=sum(temp(:)==0)
    if (step>1) flashes(step)=flashes(step-1)+stepflash; else flashes(1)=stepflash; endif
    if (stepflash==100) printf('All octopi flash simulateously at step %d\n', step); success=1; endif
    level=temp;
endwhile
printf('The number of flashes is %d\n', flashes(100));
