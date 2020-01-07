clc;
clear;

h=0.1;
t=(0:h:5);
n=length(t);

CEP(1)=proy(80);

oder=ode45(@proy2,t,CEP(1));

for i=1:n-1
    
    out  = proy(CEP(i));

    CEP(i+1)= CEP(i) + h*out;
            

end