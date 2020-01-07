function [ outc,outp] = depe2( t,c,p )

k1=0.4;
k2=0.02;
k3=0.002;
k4=0.03;


outc = k1*p-k2*c*p;

outp = k3*c*p-k4*c; 


end

