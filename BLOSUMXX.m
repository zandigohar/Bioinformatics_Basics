clc;
close all;
clear;

S1='IGLG';
S2='LGLG';
S3='LILA';
S4='AILG';


%%%%%%%%%%
cijk=[ 0    2   0.5   1.5
       2    1   2     0
       0.5  2   1     0.5
       1.5  0   0.5   3.5];
%%%%%%%%%%%%%%%
%%%%
pr=[2,3,2.5,4.5]/sum([2,3,2.5,4.5]);
%%%%


S=[S1;S2;S3;S4];%;S4;S5];

[m,n]=size(S);

count=0;
for i=1:m
    for j=i+1:m
        seq1=S(i,:);
        seq2=S(j,:);
        fprintf('Seq%d and Seq%d=%f\n',i,j,100*sum(seq1==seq2)/n)
    end
end
SS='';
for i=1:m
    SS=strcat(SS,S(i,:));
end
elements=unique(SS);
p=length(elements);

nij=zeros(1,p);

mp=m-2+1;
T=n*(mp*(mp-1)/2);

qij=cijk/T;

for i=1:p
    for j=1:p
        if i==j
            eij(i,j)=pr(i)^2;
        else
            eij(i,j)=2*pr(i)*pr(j);
        end
    end
end

SSA=round(2*log2(qij./eij));

fprintf('\t');
for i=1:p
    fprintf("%s\t",elements(i));
end
fprintf('\n');
for i=1:p
    fprintf("%s \t",elements(i))
    for j=1:i-1
        fprintf("\t")
    end
    for j=i:p
        if SSA(i,j)==-Inf
            fprintf("-\t");
        else
            fprintf("%d\t",SSA(i,j));
        end
    end
    fprintf('\n');
end