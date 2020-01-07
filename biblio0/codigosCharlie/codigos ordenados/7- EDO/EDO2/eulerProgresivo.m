function Y=eulerProgresivo(f,X,ci,h)
%esta funcion resuelve la ecuacion diferencial utilizando el metodo de
%euler progresivo
%recibe la ecuacion diferencial, un vector X equimente espaciadoy una
%condicion inicial
%retorna el vectoy Y de absisas

n=length(X);
Y=NaN(n,1);
Y(1)=ci;

for i=1:n-1
   Y(i+1)=Y(i)+h*(f.evaluameDif(Y(i))); 
end
end