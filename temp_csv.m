% chan_no = min(size(chan_name))-1;


fname = [pl4filename '.csv'];

f = fopen(fname,'w');

chan_no = kk;

% return

str_prt = [ 'time, '];
 
for kk = 1:1:chan_no
    if (kk == t_index)
    str_prt = str_prt;
    else
    str_prt = [str_prt chan_name{kk} ','];
    end
end

fprintf(f,str_prt);


h = t(2)-t(1);

%  removing t indexed column 
tempcsv(:,t_index) = []; 

% adding first column as time 
tempcsv = [t tempcsv];




for mm = 1:1:length(t)
    str_prt = ['\n']; 
    for kk = 1:1:chan_no
        str_prt = [str_prt num2str(tempcsv(mm,kk)) ','];
    end
    fprintf(f,str_prt);
end

fclose(f);



return
str_prt = [num2str(chan_no-1) ',' num2str(chan_no-1) 'A,0D' '\n'];
fprintf(f,str_prt);
% ------------------------------------


for kk = 1:1:chan_no
    %     str_prt = '1,Va1, , v, V,4.0000e-04,-20e0,0.0,0,99999,1.0,1.0,p';
%     pp = kk;
    if (kk >= t_index)
        % remove channel with only time axis
        if (kk == t_index)
%         'nop'
        else
            pp = kk-1;
            if (chan_name{kk}(1)=='v')
            str_prt =[num2str(pp) ',' chan_name{kk} ', , v, V,' num2str(a(kk)) ',' num2str(b(kk)) ',0.0,0,99999,1.0,1.0,p\n'];
            fprintf(f,str_prt);
            else
            str_prt =[num2str(pp) ',' chan_name{kk} ', , i, A,' num2str(a(kk)) ',' num2str(b(kk)) ',0.0,0,99999,1.0,1.0,p\n'];
            fprintf(f,str_prt);
            end
        end
        
    else
%   if the channel is voltage 
    
       
    
        
        fprintf(f,str_prt);
   
    end
end