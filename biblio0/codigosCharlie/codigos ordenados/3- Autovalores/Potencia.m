clc
clear
%a = [3 2;1 2];
%1 y 4

a=[-30 2 3 13; 5 11 10 8;9 7 6 12;4 14 15 1];

mx = eig(a);

v=[1;1;1;1];

numiter=1000;
eps=1e-20;
x=v(:);
y=x/norm(x);
l=0;

for k=1:numiter
x=a*y;
y=x/norm(x);
lc=x.'*y;
 if abs(l-lc)<eps
 return
 end
l=lc;
end
lmax=l;



