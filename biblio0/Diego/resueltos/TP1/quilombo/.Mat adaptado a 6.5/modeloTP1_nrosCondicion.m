% Obtencion de los numeros de condicion para las matrices del TP1

condicion = zeros(8,1);
n = [10 30 100 300 1000 3000 10000 20000];
tol = 1e-6;
Nmax = 10000;

for i=1:8
    A = generadorMatrizTP1(i);
    condicion(i) = numeroDeCondicionDeTridiag(A, tol, Nmax);
    condicion(i)
end
condicion
