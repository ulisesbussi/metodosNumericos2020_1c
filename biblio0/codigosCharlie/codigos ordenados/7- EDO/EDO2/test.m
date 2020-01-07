%test
clc
clear all
close all
Dif=f2c7;

inicio=0;
fin=30;
paso=0.01;
X=inicio:paso:fin;
c0=1;
theta=(1/2);
ana=f1c6;
YAna=solAna(ana,X,c0);
YAdam=adamsBashforth(X,paso,Dif,c0);
YAdMouPre=AdamMoutonPredictor(Dif,paso,YAdam);
YAdMou=adamsMoulton(X,paso,Dif,c0);

plot(X,YAdMouPre,'r')
hold on
plot(X,YAna,'b')