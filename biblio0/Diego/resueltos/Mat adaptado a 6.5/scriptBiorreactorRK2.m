%Script del modelado del biorreactor por Runge-Kutta 2

    clc
    clear all

    fc = @(t) 1/4 + (3/4)*exp(-0.4*t);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentraci�n del reactivo
    y1 = 1;                     %Valor a tiempo 0
    n = 500;                    %Cantidad de nodos del modelado
    alfa = 1;                   %Par�metro de RK2
    
    X = NaN(n,1);               %Prealocaci�n del vector X
    Y = NaN(n,1);               %Prealocaci�n del vector Y
    tMax = 30;                  %Tiempo m�ximo del modelado
    
    for i=1:n
        X(i) = (i-1)*tMax /(n-1);
    end

    h = X(2) - X(1);  
    Y(1) = y1;
        
    for i=1:n-1
        K1 = f1(Y(i));
        K2 = f1(Y(i) + h*alfa*K1);
        Y(i+1) = Y(i) + h*((1-(1/(2*alfa)))*K1 + (1/(2*alfa))*K2);
    end
    
    plot(X,Y);
    %fplot(fc, [0 30]);