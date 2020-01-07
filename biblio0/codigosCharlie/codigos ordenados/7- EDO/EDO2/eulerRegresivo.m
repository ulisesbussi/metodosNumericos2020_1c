function Y=eulerRegresivo(X,h,ci)
%disenhado unicamente para el problema del bioreactor perfectamente agitado
%esta funcion resuelve la ecuacion diferencial utilizando el metodo de
%euler progresivo
%recibe la ecuacion diferencial, un vector X equimente espaciado, una
%condicion inicial, una tolerancia y un numero maximo de iteraciones
%retorna el vectoy Y de absisas
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
   %Y(i+1)=biseccionParaEuler(f,h,X(i+1),Y(i),tol,nmax);
   Y(i+1)=A+(Y(i)/h);
   Y(i+1)=Y(i+1)/((1/h)+B);
end
end