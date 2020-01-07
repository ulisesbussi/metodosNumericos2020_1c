%   TP 1 - 28/09/16

% Inicializacion

i=1;
tiempoN1 = NaN(7);
resultadoN1 = NaN(10, 1);

%Modelo de toma de tiempo Gauss Seidel

[A1, b1] = generadorMatrizTP1(i);

%Parametros

itMax=10000;            %nro de iteraciones maximas
Tol=1e-6;               %tolerancia de corte
x1=zeros(10,1);         %vector inicial

%Resuelve por el método de Gauss Seidel

tic;
resultadoN1=Gauss_Seidel_Param( A1 , b1 , x1, Tol, itMax)
tiempoN1(6) = toc;

tiempoN1
resultadoN1