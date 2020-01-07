%   TP 1 - 28/09/16

% Inicializacion

    clear all;
    clc;

    i=5;        %i entre 1 y 8 selecciona el valor de n con el que se va a trabajar
    n = [10 30 100 300 1000 3000 10000 20000];
    

    
    prealocadaTemp = zeros(n(i),1);     
    tiempoJParaN_i = zeros(8,1);
    resultadoJParaN_i = zeros(8,1);     %preAlocaciones de memoria
    tiempoGSParaN_i = zeros(8,1);
    resultadoGSParaN_i = zeros(8,1);
    
    
    %Par�metros de los m�todos
    
    itMax = 1e6;              %nro de iteraciones maximas
    Tol = 1e-6;               %tolerancia de corte
    
    
    
%Ejecuta los m�todos
    
    for i=1:7
        

    %Par�metros





        [A1, b1] = generadorMatrizTP1(i);
        x1 = zeros(n(i),1);       %vector inicial



    %Resuelve por el m�todo de Jacobi

        tic;
        prealocadaTemp = algoritmoJacobi( A1 , b1 ,x1, Tol, itMax);
        tiempoJParaN_i(i) = toc;

        resultadoJParaN_i(i) = ((prealocadaTemp')*prealocadaTemp)/n(i);
        
        tiempoJParaN_i(i)
        resultadoJParaN_i(i)        %comprobaciones "on the fly"


    %Resuelve por el m�todo de Gauss Seidel

        tic;
        prealocadaTemp = Gauss_Seidel_Param( A1 , b1 ,x1, Tol, itMax);
        tiempoGSParaN_i(i) = toc;

        resultadoGSParaN_i(i) = ((prealocadaTemp')*prealocadaTemp)/n(i);
        
        tiempoGSParaN_i(i)
        resultadoGSParaN_i(i)       %comprobaciones "on the fly"
        
       
    end

    
%comprobacion final y tiempos

    tiempoJParaN_i
    resultadoJParaN_i
    tiempoGSParaN_i
    resultadoGSParaN_i
