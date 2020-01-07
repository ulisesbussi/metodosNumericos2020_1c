%   TP 1 - 28/09/16

% Inicializacion

i=1;
tiempoN1 = NaN(7);
resultadoN1 = NaN(10, 1);

%Modelo de toma de tiempo para Gauss

[A1, b1] = generadorMatrizTP1(i);
A2 = A1;
b2 = b1;

%corre primero la eliminacion de gauss con pivote, y luego realiza el
%algoritmo de remonte

tic;
[A2, b2] = elimGaussConPivote(A1, b1);
resultadoN1 = algoritmoRemonte(A2, b2);
tiempoN1(1) = toc;

tiempoN1
resultadoN1


