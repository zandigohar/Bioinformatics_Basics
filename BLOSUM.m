clc;
close all;
clear;

S1='ALIAA';
S2='ALLLA';
S3='AILIL';

S=[S1;S2;S3];%;S4;S5];

[m,n]=size(S);

SS='';
for i=1:m
    SS=strcat(SS,S(i,:));
end
elements=unique(SS);
p=length(elements);

nij=zeros(1,p);
cijk=zeros(p,p);
for k=1:n
    %step1
    for j=1:p
        temp=S(:,k)';
        nij(k,j)=length(find(temp==elements(j)));
    end
    %step2
    for i=1:p
        for j=1:p
            if i==j
                cij(i,j)=nij(k,i)*(nij(k,i)-1)/2;
            else
                cij(i,j)=nij(k,i)*nij(k,j);
            end
        end
    end
    cij
    cijk=cijk+cij;
end

T=n*(m*(m-1)/2);
qij=cijk/T;

for i=1:p
    pr(i)=length(find(S==elements(i)))/(m*n);
end

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
disp(triu(SSA));


clc;


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