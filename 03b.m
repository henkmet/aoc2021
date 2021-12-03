#!/usr/bin/octave -qf
data=dlmread('03.txt');
data=[data, ones(size(data),2)];
numbero2 = sum(data)(2);
numberco2= sum(data)(3);
j=11;
while (j>-1)
test = rem(floor(data(:,1)/(10^j)),10).*data(:,2);
if (sum(test)<numbero2/2)
test=1-test;
endif
data(:,2)=data(:,2).*test;
numbero2=sum(data)(2);
if (numbero2==1)
generator=sum(data(:,1).*data(:,2));
break;
endif
j=j-1;
endwhile
j=11;
while (j>-1)
test = rem(floor(data(:,1)/(10^j)),10).*data(:,3);
if (sum(test)<numberco2/2)
test=1-test;
endif
test=1-test;
data(:,3)=data(:,3).*test;
numberco2=sum(data)(3);
if (numberco2==1)
scrubber=sum(data(:,1).*data(:,3));
break;
endif
j=j-1;
endwhile
scrubber=bin2dec(num2str(scrubber));
generator=bin2dec(num2str(generator));
printf("Life support rating is %d\n", scrubber*generator);

