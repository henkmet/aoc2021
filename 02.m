#!/usr/bin/octave -qf
# ignore_function_time_stamp ("all");
fid=fopen('02.txt', 'r');
horizontal=0;
depth=0;
aim=0;
data=textscan(fid, '%s %f');
fclose(fid);
for i=1:length(data{1,1})
        change=data{2}(i);
switch (data{1,1}{i})
        case "down"
                aim=aim+change;
        case "up"
                aim=aim-change;
        case "forward"
                horizontal = horizontal+change;
                depth = depth+change*aim;
        otherwise
                printf("Oops, this is not supposed to occur!");
        endswitch
endfor
printf("The required product is %d\n", horizontal*depth);
