%   TP 1 - 28/09/16

% Inicializacion

i=1;
tiempoN1 = NaN(7);
resultadoN1 = NaN(10, 1);

%Modelo de toma de tiempo Cholesky

[A1, b1] = generadorMatrizTP1(i);
L = A1;
Lt = A1;

%Factoriza la matriz por el metodo de Cholesky, y resuelve por descenso L
%con b1, y por remonte L transpuesta con el resultado de la anterior
%operacion

tic;
[L]=algoritmoCholesky(A1);
resultadoN1 = algoritmoDescenso(L, b1);
Lt = L';
resultadoN1 = algoritmoRemonte(Lt, resultadoN1);
tiempoN1(3) = toc;

tiempoN1
resultadoN1