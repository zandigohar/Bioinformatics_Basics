% Stats
clc;
close all;
clear;

TP=132;
FP=983;
FN=45;
TN=63650;

P=TP+FN;
N=TN+FP;

TPR=TP/P
SPC=TN/N
FPR=FP/N
ACC=(TP+TN)/(P+N)
PPV=TP/(TP+FP)
NPV=TN/(TN+FN)
FDR=FP/(FP+TP)
MCC=(TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN))
