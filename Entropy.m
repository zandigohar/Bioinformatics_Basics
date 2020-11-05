% Shanon's Entropy
clc; close all; clear;

seq1='ACACATG';
seq2='TCTCATG';
seq3='ACTCAGC';
seq4='ATAGATA';
seq5='ACCGATA';

S=[seq1;seq2;seq3;seq4;seq5];

[m,n]=size(S);

SS='';
for i=1:m
    SS=strcat(SS,S(i,:));
end
elements=unique(SS);

p=length(elements);

for i=1:p
    Ni(i)=length(find(SS==elements(i)));
end
Pi=Ni/(m*n);

H=0;
for i=1:p
    H=H-Pi(i)*log2(Pi(i));
end
disp("Shanon's Entropy");
-Pi.*log2(Pi)
disp("H=");
disp(H);

%%%%%%%%%
disp("Relative Entropy:");
Qi=(1/p)*ones(1,p);
Pi.*log2(Pi./Qi)
HPQ=sum(Pi.*log2(Pi./Qi));
disp("H(P||Q)=");
disp(HPQ);