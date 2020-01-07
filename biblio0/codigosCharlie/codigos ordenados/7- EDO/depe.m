function [ outc, outp ] = depe( c,p )

k1=0.3;
k2=0.02;
k3=0.02;
k4=0.03;


outp = (k1*p)-(k2*c*p);

outc = (k3*c*p)-(k4*c); 


end

