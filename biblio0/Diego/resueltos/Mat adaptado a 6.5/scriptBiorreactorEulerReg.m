%Script del modelado del biorreactor por Euler regresivo

    clc
    clear all

    fc = @(t) 1/4 + (3/4)*exp(-0.4*t);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    n = 6666;                   %Cantidad de nodos del modelado
    
    X = NaN(n,1);               %Prealocación del vector X
    Y = NaN(n,1);               %Prealocación del vector Y
    tMax = 30;                  %Tiempo máximo del modelado
    
    for i=1:n
        X(i) = (i-1)*tMax /(n-1);
    end

    h = X(2) - X(1);  
    Y(1) = y1;
        
    for i=1:n-1
        Y(i+1) = (Y(i) + h*(0.1))/(1 + h*(0.4));
    end
    
    plot(X,Y);
    %fplot(fc, [0 30]);