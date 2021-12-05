#!/usr/bin/octave -qf
t=cputime();
fid=fopen('05.txt', 'r');
data=fscanf(fid, '%d , %d -> %d , %d');
fclose(fid);
for i=1:500 vent{i}=reshape(data((1+(i-1)*4):(4*i)), 1, 4); endfor
crossings=zeros(1000,1000);
for i=1:500
        a(1:4)=vent{i};
        dirh=sign(a(3)-a(1));
        dirv=sign(a(4)-a(2));
        if (dirh==0)
                for j=a(2):dirv:a(4)
                        ++crossings(a(1),j);
                endfor
        elseif (dirv==0)
                for j=a(1):dirh:a(3)
                        ++crossings(j,a(2));
                endfor
        else
                vlen=abs(a(3)-a(1));
                for j=1:(vlen+1)
                        ++crossings(a(1),a(2));
                        a(1)=a(1)+dirh;
                        a(2)=a(2)+dirv;
                endfor
        endif
endfor
crossings(crossings==1)=0;
crossings(crossings>=1)=1;
fprintf('There are %d points where more than one vent crosses.\n', sum(crossings(:)));
fprintf('This took %d seconds.\n', cputime()-t);
