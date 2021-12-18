#!/usr/bin/octave -qf
data=textread("10.txt", "%s");
errorno=0;
for i=1:length(data)
  stack=0;
  k=0;
  for j=1:length(data{i})
    switch (data{i}(j))
      case "{"
        k+=1; stack(k)=1;
      case "["
        k+=1; stack(k)=2;
      case "("
        k+=1; stack(k)=3;
      case "<"
        k+=1; stack(k)=4;
      case "}"
        if (stack(k)==1)
          k-=1;
        else 
          errorno+=1197;
          break;
        endif
      case "]"
        if (stack(k)==2)
          k-=1;
        else
          errorno+=57;
          break;
        endif
      case ")"
        if (stack(k)==3)
          k-=1;
        else
          errorno+=3;
          break;
        endif
      case ">"
        if (stack(k)==4)
          k-=1;
        else
          errorno+=25137;
          break;
        endif
      otherwise
        printf('This should not happen!\n');
    endswitch
  endfor
endfor
printf('the total error code is %d\n', errorno);
