%Script del modelado del biorreactor por Runge-Kutta 4

    clc
    clear all

    fc = @(t) 1/4 + (3/4)*exp(-0.4*t);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    n = 500;                    %Cantidad de nodos del modelado
    
    X = NaN(n,1);               %Prealocación del vector X
    Y = NaN(n,1);               %Prealocación del vector Y
    tMax = 30;                  %Tiempo máximo del modelado
    
    for i=1:n
        X(i) = (i-1)*tMax /(n-1);
    end

    h = X(2) - X(1);  
    Y(1) = y1;
        
    for i=1:n-1
        K1 = f1(Y(i));
        K2 = f1(Y(i) + (h/2)*K1);
        K3 = f1(Y(i) + (h/2)*K2);
        K4 = f1(Y(i) + h*K3);
        Y(i+1) = Y(i) + h*((1/6)*K1 + (1/3)*K2 + (1/3)*K3 + (1/6)*K4);
    end
    
    graficoLinealSimple(X,Y,'tiempo (s)','concentracion','c(t)')
    %plot(X,Y);
    %fplot(fc, [0 30]);