%   TP 1 - 28/09/16

% Inicializacion

    i=1;
    n = [10 30 100 300 1000 3000 10000 20000];
    [A1, b1] = generadorMatrizTP1(i);

    tiempoN1 = NaN(7,1);
    prealocadaTemp = NaN(n(i),1);
    resultadoN1 = NaN(7,1);

%Modelo de toma de tiempo para Gauss

    A2 = A1;        %prealocación de memoria
    b2 = b1;        %prealocación de memoria

%corre primero la eliminacion de gauss con pivote, y luego realiza el
%algoritmo de remonte

    tic;
    [A2, b2] = elimGaussConPivote(A1, b1);
    prealocadaTemp = algoritmoRemonte(A2, b2);
    tiempoN1(1) = toc;

    resultadoN1(1) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    

%Modelo de toma de tiempo LU

    L = A1;         %prealocación de memoria
    U = A1;         %prealocación de memoria

%Factoriza la matriz en L y U, y resuelve por descenso de L con b1, y luego
%por remonte de U con el resultado de la anterior operacion

    tic;
    [L,U]=algoritmoLU(A1);
    prealocadaTemp = algoritmoDescenso(L, b1);
    prealocadaTemp = algoritmoRemonte(U, prealocadaTemp);
    tiempoN1(2) = toc;
    
    resultadoN1(2) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    
%Modelo de toma de tiempo Cholesky

    L = A1;         %prealocación de memoria
    Lt = A1;        %prealocación de memoria

%Factoriza la matriz por el metodo de Cholesky, y resuelve por descenso L
%con b1, y por remonte L transpuesta con el resultado de la anterior
%operacion

    tic;
    [L]=algoritmoCholesky(A1);
    prealocadaTemp = algoritmoDescenso(L, b1);
    Lt = L';
    prealocadaTemp = algoritmoRemonte(Lt, prealocadaTemp);
    tiempoN1(3) = toc;
    
    resultadoN1(3) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    
%Modelo de toma de tiempo Thomas

    L = A1;         %prealocación de memoria
    U = A1;         %prealocación de memoria

%Factoriza la matriz en L y U por el metodo de Thomas, y resuelve por descenso de L con b1, y luego
%por remonte de U con el resultado de la anterior operacion

    tic;
    [L,U]=algoritmoThomas(A1);
    prealocadaTemp = algoritmoDescenso(L, b1);
    prealocadaTemp = algoritmoRemonte(U, prealocadaTemp);
    tiempoN1(4) = toc;
    
    resultadoN1(4) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    
%Modelo de toma de tiempo jacobi
%Parámetros

    itMax = 10000;            %nro de iteraciones maximas
    Tol = 1e-6;               %tolerancia de corte
    x1 = zeros(n(i),1);       %vector inicial

%Resuelve por el método de Jacobi

    tic;
    prealocadaTemp = algoritmoJacobi( A1 , b1 ,x1, Tol, itMax);
    tiempoN1(5) = toc;
    
    resultadoN1(5) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    
%Modelo de toma de tiempo Gauss Seidel
%Parámetros

    itMax = 10000;            %nro de iteraciones maximas
    Tol = 1e-6;               %tolerancia de corte
    x1 = zeros(n(i),1);       %vector inicial

%Resuelve por el método de Gauss Seidel

    tic;
    prealocadaTemp = Gauss_Seidel_Param( A1 , b1 , x1, Tol, itMax);
    tiempoN1(6) = toc;

    resultadoN1(6) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    
%Modelo de toma de tiempo MatLab
%Resuelve por el método de MatLab

    tic;
    prealocadaTemp = A1\b1;
    tiempoN1(7) = toc;
    
    resultadoN1(7) = ((prealocadaTemp')*prealocadaTemp)/n(i);
    
    
%Impresión por pantalla - chequeo de validez

    tiempoN1
    resultadoN1
    