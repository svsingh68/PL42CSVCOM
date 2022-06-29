% Created by Santosh Singh, EE-IITB, June2022
% santoshvsingh68@gmail.com
%----------------------------------------------------
% Note: 
%0) PL4 file to COMTRADE and CSV file with header
%1) All channels are digitized between 0 and 99999
%2) All channels are considered as analog. 
%   No digital for COMTRADE
%3) By default most signal units are kept as ampere, A
%----------------------------------------------------

clc;clear

% Note the pl4 file should be in the same
% directory.
% Enter pl4 filename as 'filename.pl4'

pl4filename = input('Enter a *.pl4 filename in the same dir: ')
save pl4filename.mat;

cmd_pl42mat = 'Pl42mat.exe ';
cmd_pl42mat = [cmd_pl42mat pl4filename];

[~,~] = system(cmd_pl42mat);

disp('Extracting data from *.pl4 done')
pause(0.5)
disp(' ')
disp('Generating COMTRADE file')
clear cmd_pl42mat;

pl4filename((end-3):end) = [];


fname = [pl4filename '.mat'];
load(fname)
clear pl4filename fname

clear ans
aa = who;

load pl4filename.mat
pl4filename((end-3):end) = [];


% --------------------
maxint = 99999;

format long g

xarray = [(1:length(t))' round(t*1e6)];
    

for kk = 1:1:length(aa)
    
    if(find(aa{kk}=='t')==1)
        t_index = kk;
    else
        x = eval(aa{kk});
        
    % for csv gen data:
        tempcsv(:,kk) = x;       
        
        [xdig,a(kk),b(kk)] = getabsig(x,maxint);
        chan_name{kk} = aa{kk};
        xarray = [xarray xdig];
    end
    
end


% return
fname = [pl4filename '.dat'];

% return
dlmwrite(fname, xarray, 'delimiter', ',', 'precision', '%i')
disp('*.dat file generated')

%---------------------------
% calling comtrade data gen
temp_com
%---------------------------

disp(' ')
disp('Generating CSV file')

%---------------------------
% calling CSV data gen
temp_csv
%---------------------------

disp('*.csv file generated')

