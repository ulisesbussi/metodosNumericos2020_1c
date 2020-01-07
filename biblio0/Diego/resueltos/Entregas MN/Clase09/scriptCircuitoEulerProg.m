%Script de la búsqueda de Vc(t) por Euler progresivo

clc
clear all

h = 1e-5;
tMax = 0.5;         %en segundos

X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h entre 0 y tMax
n = length(X);      
W = NaN(size(X));   %prealoco el vector W con la misma forma que el vector X
V = NaN(size(X));

L = 0.1;
C = 10e-3;
R1 = 10;
R2 = 10;
e = 5;

fw = @(w,v,t) -(1./(L.*C)).*((L./R2) + C.*R1).*w - (1/(L.*C)).*(1 + R1./R2).*v + e./(L.*C); %ecuación de la der. de w
W(1) = 0;
V(1) = 0;

for i=1:n-1
    W(i+1) = W(i) + h*fw(W(i),V(i), X(i));
    V(i+1) = V(i) + h*W(i);
end

plot(X,V);