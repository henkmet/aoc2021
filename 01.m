#!/usr/bin/octave -qf
# ignore_function_time_stamp ("all");
data=dlmread('01.txt');
count=0;
slide=sum(data(1:3));
for i=4:length(data)
newslide=slide-data(i-3)+data(i);
if newslide>slide
count=count+1;
endif
slide=newslide;
endfor
printf("Windows larger than previous is %d\n", count);
