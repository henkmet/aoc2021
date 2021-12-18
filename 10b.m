#!/usr/bin/octave -qf
data=textread("10.txt", "%s");
lines=0;
for i=1:length(data)
  stack=0;
  k=0;
incomplete=1;
  for j=1:length(data{i})
    switch (data{i}(j))
      case "("
        k+=1; stack(k)=1;
      case "["
        k+=1; stack(k)=2;
      case "{"
        k+=1; stack(k)=3;
      case "<"
        k+=1; stack(k)=4;
      case ")"
        if (stack(k)==1)
          k-=1;
        else 
          incomplete=0; break;
        endif
      case "]"
        if (stack(k)==2)
          k-=1;
        else
          incomplete=0; break;
        endif
      case "}"
        if (stack(k)==3)
          k-=1;
        else
          incomplete=0; break;
        endif
      case ">"
        if (stack(k)==4)
          k-=1;
        else
          incomplete=0; break;
        endif
      otherwise
        printf('This should not happen!\n');
    endswitch
  endfor
  if (incomplete)
    lines+=1;
    linescore(lines)=0;
    for i=k:-1:1
      linescore(lines)=5*linescore(lines)+stack(i);
    endfor
  endif
endfor
printf('The middle score is %d\n', median(linescore));
