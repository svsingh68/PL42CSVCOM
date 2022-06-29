fname = [pl4filename '.cfg'];

f = fopen(fname,'w');

str_prt = 'SVS Substation DR, 999,1999\n';
fprintf(f,str_prt);
chan_no = kk;

str_prt = [num2str(chan_no-1) ',' num2str(chan_no-1) 'A,0D' '\n'];
fprintf(f,str_prt);
% ------------------------------------


for kk = 1:1:chan_no
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
    if (chan_name{kk}(1)=='v')
        str_prt =[num2str(kk) ',' chan_name{kk} ', , v, V,' num2str(a(kk)) ',' num2str(b(kk)) ',0.0,0,99999,1.0,1.0,p\n'];
        fprintf(f,str_prt);
    else 
        str_prt =[num2str(kk) ',' chan_name{kk} ', , i, A,' num2str(a(kk)) ',' num2str(b(kk)) ',0.0,0,99999,1.0,1.0,p\n'];
        fprintf(f,str_prt);
    end
    end
end

h = t(2)-t(1);
% ------------------------------------
str_prt = '50\n0\n';
fprintf(f,str_prt);

str_prt = [num2str(1/h) ', ' num2str(length(t)) '\n'];
fprintf(f,str_prt);
str_prt = '01/06/2022, 21:23:58:962000\n';
fprintf(f,str_prt);
str_prt = '01/06/2022, 21:23:58:962000\n';
fprintf(f,str_prt);
str_prt = 'ASCII\n';
fprintf(f,str_prt);

% str_prt = [num2str(t(end))];
str_prt = [num2str(1)];
fprintf(f,str_prt);

fclose(f);
disp('*.cfg ascii file generated')


delete('pl4filename.mat')
delete([pl4filename '.mat'])

