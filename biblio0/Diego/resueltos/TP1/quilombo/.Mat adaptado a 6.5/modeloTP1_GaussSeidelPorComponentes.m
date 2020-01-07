%   TP 1 - 28/09/16

% Inicializacion

    clear all;
    clc;

    i=2;        %i entre 1 y 8 selecciona el valor de n con el que se va a trabajar
    n = [10 30 100 300 1000 3000 10000 20000];
    [A1, b1] = generadorMatrizTP1(i);

    tiempoN1 = zeros(7,1);
    prealocadaTemp = zeros(n(i),1);
    resultadoN1 = zeros(7,1);

%Modelo de toma de tiempo Gauss Seidel por componentes
%Parámetros

    itMax = 1e6;              %nro de iteraciones maximas
    Tol = 1e-6;               %tolerancia de corte
    x1 = zeros(n(i),1);       %vector inicial



%Resuelve por el método de Gauss Seidel por componentes

    tic;
    prealocadaTemp = algoritmoGaussSeidelPorComponentes( A1 , b1 ,x1, Tol, itMax);
    tiempoN1(5) = toc;
    
    resultadoN1(5) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    tiempoN1(5)
    resultadoN1(5)
    