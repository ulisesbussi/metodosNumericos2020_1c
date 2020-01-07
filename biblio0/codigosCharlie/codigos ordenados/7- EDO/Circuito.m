clc;
clear;

h=0.1;
t=(0:0.01:1);
n=length(t);

CEP(1,1)=0;
CEP(1,2)=0;

for i=1:n-1
    
    CEP(i+1,2)=CEP(i,2)+(CEP(i,1)*h);
    
    out  = RLC(CEP(i,1),CEP(i,2));

    CEP(i+1,1)= CEP(i,1) + h*out;
            

end