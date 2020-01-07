function [ out ] = RLC( w,v )

r=10;
l=0.1;
c=10^(-3);
e=5;
%Simplifico

A=1+(r/r);
B=(c*r)+(l/r);
C=l*c;

out = (e-(A*v)-(B*w))/C;


end

