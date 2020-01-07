%   TP 1 - 28/09/16

% Inicializacion

i=1;
tiempoN1 = NaN(7);
resultadoN1 = NaN(10, 1);

%Modelo de toma de tiempo Matlab

[A1, b1] = generadorMatrizTP1(i);

%Resuelve por el método de Matlab

tic;
resultadoN1=A1\b1;
tiempoN1(7) = toc;

tiempoN1
resultadoN1
