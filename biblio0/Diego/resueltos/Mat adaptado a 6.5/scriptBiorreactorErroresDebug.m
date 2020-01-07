%Errores para los métodos eP, eR, RK2,3,4 para el ejercicio del biorreactor

clc
clear all

fc = @(t) 1/4 + (3/4)*exp(-0.4*t);  %Función de la concentración analítica
tau = 1.7;    %Valor cercano al tiempo medio del decaimiento de c
real = fc(tau);

n = 5;
h = logspace(-5,-1,n);
%h = [1e-5  1e-4  1e-3 1e-2 1e-1];
%h = [1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2];
%h = [1e-1 1e-2 1e-3 1e-4 1e-5];
%n = length(h);

% hNro = 5;
% hMin = 1e-5;
% hMax = 1e-4;
% hSalto = hMax/hNro;
tMax = 2;


% h = (hMin:hSalto:hMax);
% n = length(h);
error = NaN(6,n);
tiempos = NaN(6,n);

for i=1:n
    pos = round(tau/h(i));
    X = (0:h(i):tMax);      %(tau + h(i))
    Y = NaN(size(X));
    
    tic;
    Y = funcionBiorreactorThetaM_2(X,1);      %Euler prog.
    tiempos(1,i) = toc;
    error(1,i) = abs(Y(pos) - real);
    
    tic;
    Y = funcionBiorreactorThetaM_2(X,0);      %Euler reg.
    tiempos(2,i) = toc;
    error(2,i) = abs(Y(pos) - real);
     
    tic;
    Y = funcionBiorreactorThetaM_2(X,1/2);    %Theta-M.
    tiempos(3,i) = toc;
    error(3,i) = abs(Y(pos) - real);
    
    tic;
    Y = funcionBiorreactorRK2_2(X);           %Runge Kutta 2
    tiempos(4,i) = toc;
    error(4,i) = abs(Y(pos) - real);
    
    tic;
    Y = funcionBiorreactorRK3_2(X);           %Runge Kutta 3
    tiempos(5,i) = toc;
    error(5,i) = abs(Y(pos) - real);
    
    tic;
    Y = funcionBiorreactorRK4_2(X);           %Runge Kutta 4
    tiempos(6,i) = toc;
    error(6,i) = abs(Y(pos) - real);
    
    X(pos)
    
end

XL = logspace(h(1),h(n),n);
loglog(XL.*h,error)
%plot(tiempos,h);



