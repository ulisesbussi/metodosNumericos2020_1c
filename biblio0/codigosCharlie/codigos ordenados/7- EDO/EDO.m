

j=1;

for k=1:length(hvec)
    
h=hvec(k);
    
t=(0:h:tf);

CEP=NaN(size(t));
CER=NaN(size(t));
Cthe=NaN(size(t));

n=length(t);

k=0.3;
V=10;
F=1;
Cin=1;

theta=1/2;

CEP(1)=Cin;
CER(1)=Cin;
Cthe(1)=Cin;

A=(F/V)*Cin;

B=(k+(F/V));



for i=1:n-1
    
    out  = bioreactor( k,F,V,CEP(i),Cin);

    CEP(i+1)= CEP(i) + h*out;
    
    CER(i+1)= (A*h + CER(i)) / (1 + B*h);
    
    out2=bioreactor( k,F,V,CEP(i),Cin);
     
    Cthe(i+1)= Cthe(i) + h*( theta * out + (1-theta)*out2);
    
    

end

C1= 1- A/B;
Canalitico= A/B + (C1 * exp(-B*t));

time = -(log(0.63-A/B))/(-log(C1)*B);

time=round(time);


ECEP(j) = abs(Canalitico(time)-CEP(time));
ECER(j) = abs(Canalitico(time)-CER(time));
ECET(j) = abs(Canalitico(time)-Cthe(time));

j=j+1;

end