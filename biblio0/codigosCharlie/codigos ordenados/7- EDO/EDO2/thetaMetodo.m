function Y=thetaMetodo(X,f,h,theta,ci)
%esta funcion esta diseñada para resolver el problema de la clase 7 de
%metodos numericos
%Bioreactor perfectamente agitado

F=1;
cin=1;
V=10;
k=0.3;
%simplificacion intermedia
A=(F/V)*cin;
B=(k+(F/V));


n=length(X);
Y=NaN(1,n);
Y(1)=ci;
for i=1:n-1
   %a1=(Y(i)/h)+(theta*(A-B*Y(i)))+(A*(1-theta)); no funciono con ste
   %despeje
   %a2=(1/h)+(theta-1)*B; este tampoco
   a3=(A-(B*Y(i)));
   a1=((theta)*(a3))+(Y(i)/h)+(A*(1-theta));
   a2=(1/h)+((1-theta)*B);
   Y(i+1)=a1/a2;
end

end