
j=1

for k=1:length(hvec)

h=hvec(k);    
    
t=(0:h:tf);


RK3=NaN(size(t));
RK4=NaN(size(t));

k=0.3;
V=10;
F=1;
Cin=1;

n=length(t);


RK3(1)=Cin;
RK4(1)=Cin;

A=(F/V)*Cin;

B=(k+(F/V));

for i=1:n-1
    
    %% Runge Kutta 3    
    K1  = bioreactor( k,F,V,RK3(i),Cin);

    parcial = RK3 (i) + (1/2)*h*K1;
    
    K2  = bioreactor( k,F,V,parcial,Cin);
    
    parcial = RK3(i) + h*(-K1+2*K2);
    
    K3 = bioreactor( k,F,V,parcial,Cin);
    
    RK3(i+1) = RK3(i)+h*((1/6)*K1+(2/3)*K2+(1/6)*K3);
    
    
     %% Runge Kutta 4
    
     K1  = bioreactor( k,F,V,RK4(i),Cin);

    parcial = RK4 (i) + (1/2)*h*K1;
    
    K2  = bioreactor( k,F,V,parcial,Cin);
    
    parcial = RK4 (i) + (1/2)*h*K2;
    
    K3  = bioreactor( k,F,V,parcial,Cin);

    parcial = RK4 (i) + (h*K3);
    
    K4  = bioreactor( k,F,V,parcial,Cin);
         
    RK4(i+1) = RK4(i)+h*((1/6)*K1+(1/3)*K2+(1/3)*K3+(1/6)*K4);

end

C1= 1- A/B;
Canalitico= A/B + (C1 * exp(-B*t));

time = -(log(0.63-A/B))/(-log(C1)*B);

time=round(time);


ERK4(j) = abs(Canalitico(time)-RK4(time));
ERK3(j) = abs(Canalitico(time)-RK3(time));
j=j+1;

end