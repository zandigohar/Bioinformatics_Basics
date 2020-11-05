% Semi-Global Alignmnet
% Fixed scores
clc;
close all;
clear;

T="TCAGACT";
S="CTATAAGAC";

gap=-2;
mismatch=-1;
match=1;

T = convertStringsToChars(T);
S = convertStringsToChars(S);
m = length(T);
n = length(S);
fprintf("1. Ignore the end space after S\n2. Ignore the end space after T\n3. Ignore the space before S\n4. Ignore the space before T\n");
disp("______________________________________________________________");
inq=str2num(input("Enter the code:",'s'));
clc;
disp("______________________________________________________________");
if inq==1
    % 1. Ignore the end space after S
    disp("1. Ignore the end space after S");
    M = zeros(n+1,m+1);
    M(1,:)=gap*(0:m);
    M(:,1)=gap*(0:n);
    
    fprintf('(%d)    ',M(1,:));
    fprintf('\n')
    for i=2:n+1
        s='';
        fprintf('(%d)',M(i,1));
        for j=2:m+1
            up=M(i-1,j)+gap;
            left=M(i,j-1)+gap;
            if T(j-1)==S(i-1)
                diags=M(i-1,j-1)+match;
            else
                diags=M(i-1,j-1)+mismatch;
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
                fprintf(' | (%d) ',M(i,j));
            elseif max_m==left
                fprintf(' < (%d) ',M(i,j));
            else
                fprintf(' \\ (%d) ',M(i,j));
            end
        end
        fprintf('\n');
    end
    disp("M=")
    disp(M);
    disp("Take the maximum value in the last row of DP matrix M");
    
    disp("______________________________________________________________");
elseif inq==2
    % 2. Ignore the end space after T
    disp("2. Ignore the end space after T:");
    M = zeros(n+1,m+1);
    M(1,:)=gap*(0:m);
    M(:,1)=gap*(0:n);
    
    fprintf('(%d)    ',M(1,:));
    fprintf('\n')
    for i=2:n+1
        s='';
        fprintf('(%d)',M(i,1));
        for j=2:m+1
            up=M(i-1,j)+gap;
            left=M(i,j-1)+gap;
            if T(j-1)==S(i-1)
                diags=M(i-1,j-1)+match;
            else
                diags=M(i-1,j-1)+mismatch;
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
                fprintf(' | (%d) ',M(i,j));
            elseif max_m==left
                fprintf(' < (%d) ',M(i,j));
            else
                fprintf(' \\ (%d) ',M(i,j));
            end
        end
        fprintf('\n');
    end
    disp("M=")
    disp(M);
    disp("Take the maximum value in the last column of DP matrix M");
    
    disp("______________________________________________________________");
elseif inq==3
    % 3. Ignore the space before S
    disp("3. Ignore the space before S");
    M = zeros(n+1,m+1);
    M(1,:)=0*(0:m);
    M(:,1)=gap*(0:n);
    
    fprintf('(%d)    ',M(1,:));
    fprintf('\n')
    for i=2:n+1
        s='';
        fprintf('(%d)',M(i,1));
        for j=2:m+1
            up=M(i-1,j)+gap;
            left=M(i,j-1)+gap;
            if T(j-1)==S(i-1)
                diags=M(i-1,j-1)+match;
            else
                diags=M(i-1,j-1)+mismatch;
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
                fprintf(' | (%d) ',M(i,j));
            elseif max_m==left
                fprintf(' < (%d) ',M(i,j));
            else
                fprintf(' \\ (%d) ',M(i,j));
            end
        end
        fprintf('\n');
    end
    disp("M=")
    disp(M);
    
    
    disp("______________________________________________________________");
elseif inq==4
    % 4. Ignore the space before T
    disp("4. Ignore the space before T");
    M = zeros(n+1,m+1);
    M(1,:)=gap*(0:m);
    M(:,1)=0*(0:n);
    
    fprintf('(%d)    ',M(1,:));
    fprintf('\n')
    for i=2:n+1
        s='';
        fprintf('(%d)',M(i,1));
        for j=2:m+1
            up=M(i-1,j)+gap;
            left=M(i,j-1)+gap;
            if T(j-1)==S(i-1)
                diags=M(i-1,j-1)+match;
            else
                diags=M(i-1,j-1)+mismatch;
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
                fprintf(' | (%d) ',M(i,j));
            elseif max_m==left
                fprintf(' < (%d) ',M(i,j));
            else
                fprintf(' \\ (%d) ',M(i,j));
            end
        end
        fprintf('\n');
    end
    disp("M=")
    disp(M);
end

[~, ALIGNMENT, ~] = nwalign(T,S);
disp("Alignment:")
disp(ALIGNMENT);