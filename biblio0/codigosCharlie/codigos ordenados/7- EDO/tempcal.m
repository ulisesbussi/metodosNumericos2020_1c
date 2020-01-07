clc;
clear;

hx=0.25;
ht=0.2;
t=(0:ht:10);
x=(0:hx:2);

n=length(t);
m=length(x);


K=0.1515;

CEP(m,n)=0;

for j=1:m
         CEP(j,1) = calorX(x(j));
end

CEP(m,1)=0;
CEP(1,1)=0;


 for i=1:n-1
             
        out = K*diff(diff(CEP(1:m,1)));
                 
         CEP(1:m,i+1)=CEP(1:m,i) + ht*CEP(1:m,i);
         
    
 end