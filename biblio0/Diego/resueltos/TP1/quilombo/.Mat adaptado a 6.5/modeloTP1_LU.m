%   TP 1 - 28/09/16

% Inicializacion

i=1;
tiempoN1 = NaN(7);
resultadoN1 = NaN(10, 1);

%Modelo de toma de tiempo LU

[A1, b1] = generadorMatrizTP1(i);
L = A1;
U = A1;

%Factoriza la matriz en L y U, y resuelve por descenso de L con b1, y luego
%por remonte de U con el resultado de la anterior operacion

tic;
[L,U]=algoritmoLU(A1);
resultadoN1 = algoritmoDescenso(L, b1);
resultadoN1 = algoritmoRemonte(U, resultadoN1);
tiempoN1(2) = toc;

tiempoN1
resultadoN1