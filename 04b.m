#!/usr/bin/octave -qf
fid=fopen('04.txt', 'r');
draws=dlmread(fid, ',', [0,0,0,99]);
data = fscanf(fid, '%f');
for i=1:100
        card{i} = reshape(data((25*(i-1)+1):(25*i)), 5 , 5)';
endfor
cardsleft=ones(1,100);
mask=ones(1,100);
mask(draws(1:4)+1)=0; #not possible to get bingo during first four draws
for i=5:100
sum(cardsleft)
        mask(draws(i)+1)=0;
        for j=1:100
                if (cardsleft(j)==1)
                        reduced = reshape(mask(card{j}(:)+1),5,5);
                        if (min([sum(reduced(:,1:5),1),sum(reduced(:,1:5),2)'])==0)
                                score = sum((card{j}.*reduced)(:))*draws(i);
                                cardsleft(j)=0;
                        endif
                endif
        endfor
if (cardsleft==0) break; endif
endfor
printf("The final score on the winning board will be %d\n", score);
