% Logo
clc;
close all;
clear;
seq1='KEVLN';
seq2='KIVMN';
seq3='TIVMK';
seq4='MEVLN';

% Height of logo
S=[seq1;seq2;seq3;seq4];

[m,n]=size(S);

SS='';
for i=1:m
    SS=strcat(SS,S(i,:));
end
elements=unique(SS);

p=length(elements);
disp("Pk(i)=Nk(i)/N(i)=");
nij=zeros(1,p);
pr=zeros(p,p);
for i=1:n
    %step1
    for j=1:p
        temp=S(:,i)';
        nij(j,i)=length(find(temp==elements(j)));
    end
    %step2
end
pr=nij/4;

fprintf('\t\t');
for i=1:n
    fprintf("%d \t\t\t",i)
end
fprintf('\n');
for i=1:p
    fprintf("%s \t",elements(i))
    for j=1:n
            fprintf("%f\t",pr(i,j));
    end
    fprintf('\n');
end
fprintf('\n');
disp("Ri=");
Ri=log2(p)*ones(7,1);
for i=1:n
    for j=1:p
        if pr(j,i)
            Ri(i,1)=Ri(i,1)+pr(j,i).*log2(pr(j,i));
        end
    end
        disp(Ri(i,1));
end
disp("Ri=");
% Height of each letter
HL=zeros(p,n);

disp('Height of each letter');
for i=1:n
    HL(:,i)=pr(:,i)*Ri(i,1);
end
disp(1:n);
disp(HL)