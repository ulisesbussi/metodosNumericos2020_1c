
j=1;

for k=1:length(hvec)
    
h=hvec(k);

t=(0:h:tf);


CEM=NaN(size(t));
CEJ=NaN(size(t));

k=0.3;
V=10;
F=1;
Cin=1;

n=length(t);


CEJ(1)=Cin;
CEM(1)=Cin;

A=(F/V)*Cin;

B=(k+(F/V));

for i=1:n-1
    
    %% Modificado    
    out  = bioreactor( k,F,V,CEM(i),Cin);

    parcial = CEM (i) + (1/2)*h*out;
    
    out  = bioreactor( k,F,V,parcial,Cin);
    
    CEM(i+1)= CEM(i) + h*out;
    
    %% Mejorado
    
     out  = bioreactor( k,F,V,CEJ(i),Cin);
     out2= CEJ(i)+h*out;
     out3 = bioreactor( k,F,V,out2,Cin);
     parcial = ((1/2)*out)+((1/2)*out3);
     CEJ(i+1) = CEJ(i) + h*parcial;
    

end

C1= 1- A/B;
Canalitico= A/B + (C1 * exp(-B*t));

time = -(log(0.63-A/B))/(-log(C1)*B);

time=round(time);


ECEM(j) = abs(Canalitico(time)-CEM(time));
EMEJ(j) = abs(Canalitico(time)-CEJ(time));

j=j+1;
end