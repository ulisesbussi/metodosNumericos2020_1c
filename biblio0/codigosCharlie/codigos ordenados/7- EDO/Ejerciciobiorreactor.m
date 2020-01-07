% Ejercicio biorreactor

clear all
clc  

% DATOS DEL EJERCICIO

k=0.3;

v=10;

f=1;

cin=1;

C0=1;

h=0.7;

% DATOS ESTABLECIDOS DEL METODO EULER

A=(f*cin)/v;

B=k+(f/v);

ConstInt = C0 - A/B;

t0 = 0;

tf = 30;

t = (t0:h:tf);

n=length(t);

% METODO DE EULER PROGRESIVO

CEP = NaN(size(t));
 
CEP(1) = C0;

 for i=1:n-1
     
  CEP(i+1) = CEP(i) + h*(A-B*CEP(i));
     
 end

plot(t,CEP,'r--')
 grid on
 hold on
 
% EULER REGRESIVO

yi2 = NaN(size(t));

yi2(1)=C0;

for j=1:n-1

 yi2(j+1)=(A*h+yi2(j))/(1+B*h);

end

plot(t,yi2,'k')

%  THETA METODO

THETA=1/5;

ys3 = NaN(size(t));

ys3(1)=C0;

for k=1:n-1
 
 Numerador= ys3(k) + h*(A-(THETA*B*ys3(k)));
 
 Denominador=1+(h*B*(1-THETA));

 ys3(k+1)=Numerador/Denominador;

end

 plot(t,ys3,'m')

% ANALITICA

CA = A/B + ConstInt*exp(-B*t);

plot(t,CA,'y')


% METODOS DE RUNGE KUTTA 


% METODO DE EULER MODIFICADO Y MEJORADO

ys4 = NaN(size(t));

ys4(1)=C0;

ALFA=1;

for l=1:n-1
  
   k1=A-B*(ys4(l));
   
   k2=A-B*(ys4(l)+h*ALFA*k1);
   
  ys4(l+1)=ys4(l)+h*((1-(1/2*ALFA))*k1+(1/2*ALFA)*k2);
end

plot(t,ys4,'g--')

% METODO DE RUNGE KUTTA 3 

ys5 = NaN(size(t));

ys5(1)=C0;

for m=1:n-1
  
   k1=A-B*(ys5(m));
   
   k2=A-B*(ys5(m)+(h/2)*k1);
   
   k3=A-B*(ys5(m)+h*(-k1+2*k2));
   
  ys5(m+1)=ys5(m)+h*((1/6)*k1+(2/3)*k2+(1/6)*k3);
end

plot(t,ys5,'b--')

% METODO DE RUNGE KUTTA 4 

ys6 = NaN(size(t));

ys6(1)=C0;

for p=1:n-1
  
   k1=A-B*(ys6(p));
   
   k2=A-B*(ys6(p)+(h/2)*k1);
   
   k3=A-B*(ys6(p)+(h/2)*k2);
   
   k4=A-B*(ys6(p)+h*k3);
   
  ys6(p+1)=ys6(p)+h*((1/6)*k1+(1/3)*k2+(1/3)*k3+(1/6)*k4);
end

plot(t,ys6,'c--')

% METODOS MULTIPASO


% METODO ADAMS BASHFORTH

ys7 = NaN(size(t));

ys7(1)=C0;

ys7(2)=ys5(2);

ys7(3)=ys5(3);

for q=3:n-1
   
     ys7(q+1)= ys7(q)+(h/12)*(23*(A-B*ys7(q))-16*(A-B*ys7(q-1))+5*(A-B*ys7(q-2)));
  
end

plot(t,ys7,'c')


% METODO ADAMS MOULTON

ys8 = NaN(size(t));

ys8(1)=C0;

ys8(2)=ys6(2);

ys8(3)=ys6(3);


% tenes que declarar implicito para usar ys8(r+1) no ys6(r+1) que seria seguir
% usando otro metodo, siempre tenes que usar ys8

for r=3:n-2
   
ys8(r+1)= ys8(r)+(h/24)*(9*(A-B*ys6(r+1))+19*(A-B*ys6(r))-5*(A-B*ys6(r-1))+(A-B*ys6(r-2)));
  
end

 plot(t,ys8,'m--')
 
%  METODO DE DIFERENCIA REGRESIVA ORDEN 2

ys9 = NaN(size(t));

ys9(1)=C0;

ys9(2)=ys6(2);

%%Idem punto anterior

for s=2:n-1
   
ys9(s+1)= (-1/3)*ys9(s-1)  +  (4/3)*ys9(s)  -  (2/3)*h*(A-B*ys9(s+1));
  
end

 plot(t,ys9,'m--')

% METODO DE DIFERENCIA REGRESIVA ORDEN 3

ys10 = NaN(size(t));

ys10(1)=C0;

ys10(2)=ys6(2);

ys10(3)=ys6(3);

for ul=3:n-1
   
ys10(ul+1)=(11/18)*ys10(ul) -  (9/11)*ys10(ul-1) +  (2/11)*ys10(ul-2) + (6/11)*h*(A-B*ys10(s+1)) ;
  
end

plot(t,ys10,'b--')

[T,ys11]=ode45(@bioreac2,t,1);

plot(t,ys11,'b')

legend('EULER PROGRESIVO','EULER REGRESIVO','THETA METODO','ANALITICA','EULER MODIFICADO Y MEJORADO','METODO DE RUNGE KUTTA 3','METODO DE RUNGE KUTTA 4','METODO ADAMS BASHFORTH','METODO ADAMS MOULTON','METODO DE DIFERENCIA REGRESIVA ORDEN 2','METODO DE DIFERENCIA REGRESIVA ORDEN 3','ODE45') 

