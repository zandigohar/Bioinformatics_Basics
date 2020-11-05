% Global Alignmnet
% Fixed scores
clc;
close all;
clear;

T="CTGG";
S="CAAG";

gap=-3;

T = convertStringsToChars(T);
S = convertStringsToChars(S);
m = length(T);
n = length(S);

%SS = zeros(n,m);
% CTGG
% CAAG
SS = [3,-1,-3,-3
    -1, -3, -3, -3
    -3, -1, -1, 3
    -3, -1, -1, 3]';

M = zeros(n+1,m+1);
M(1,:)=gap*(0:m);
M(:,1)=gap*(0:n);

p=max(m,n)-1;
B=zeros(p,2);
B(1,:)=[1,1];
fprintf('(%d)    ',M(1,:));
fprintf('\n')
for i=2:n+1
    s='';
    fprintf('(%d)',M(i,1));
    for j=2:m+1
        up=M(i-1,j)+gap;
        left=M(i,j-1)+gap;
        if T(j-1)==S(i-1)
            diags=M(i-1,j-1)+SS(i-1,j-1);
        else
            diags=M(i-1,j-1)+SS(i-1,j-1);
        end
        comp=[up,left,diags];
        M(i,j)=max(comp);
        max_m=M(i,j);
        if max_m==up && max_m==left
            fprintf(' <|(%d) ',M(i,j));
            
        elseif max_m==up && max_m==diags
            fprintf(' \\|(%d) ',M(i,j));
            
        elseif max_m==diags && max_m==left
            fprintf(' <\\(%d) ',M(i,j));
            
        elseif max_m==up
            i_max=i-1;
            j_max=j;
            fprintf(' | (%d) ',M(i,j));
            s(j-1)='|';
        elseif max_m==left
            i_max=i;
            j_max=j-1;
            fprintf(' < (%d) ',M(i,j));
            s(j-1)=' ';
        else
            i_max=i-1;
            j_max=j-1;
            fprintf(' \\ (%d) ',M(i,j));
            s(j-1)='.';
        end
        
    end
    fprintf('\n');
end
disp("M=")
disp(M);
[~, ALIGNMENT, ~] = nwalign(T,S);
disp("Alignment:")
disp(ALIGNMENT);