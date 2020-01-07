%Script de la búsqueda de Vc(t) por Euler regresivo

clc
clear all

h = 1e-5;
tMax = 0.5;         %en segundos

X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h entre 0 y tMax
n = length(X);      
W = NaN(size(X));   %prealoco los vectores W y V con la misma forma que el vector X
V = NaN(size(X));

W(1) = 0;
V(1) = 0;

for i=1:n-1
    W(i+1) = funcionCircuitoEulerReg(h,W(i),V(i));
    V(i+1) = V(i) + h*W(i+1);
end

plot(X,V);