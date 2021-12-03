#!/usr/bin/octave -qf
data=dlmread('03.txt');
readings=length(data);
gamma=0;
epsilon=0;
for j=1:12
        number=0;
        i=12-j;
        test=floor(data/(10^i));
        number=sum(test);
printf("number %d\n", number);
        if number>500
                gamma=gamma+2^i;
        else
                epsilon=epsilon+2^i;
        endif
        data=data-test*10^i;
endfor
printf("The power rate is %d\n", gamma*epsilon);
