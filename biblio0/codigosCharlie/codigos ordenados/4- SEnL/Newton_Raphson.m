
function [X1] = Newton_Raphson()

syms x    %declaramos a X una variable simbólica
Y=x*x*x-9;  %se solicita la entrada de la función



%graficamos la función en un intervalo para poder tomar una buena
%estimación de la raíz
sup = 10;
in = -10;
t = linspace(in,sup,500);    %generamos un vector con los valores
plot(t,subs(Y,t))               %generamos la gráfica
grid on


Xn=1;    %se solicita la estimación inicial
Ydx = diff(Y,x);   %derivamos la funcion Y con respecto a X y lo asignamos a la variable Ydx

%inicializar varibles
error = 1;
tolerancia = 0.000001;
n=10;
i=2;
    while error>=tolerancia && i<n    %condición de terminación cuando el error sea menor a la tolerancia 
         
         X1 = Xn - (subs(Y,Xn)/subs(Ydx,Xn));  %formula de Newton-Raphson
         error = abs((X1-Xn)/X1);              %calculo del error
         Xn=X1;  %asignación del nuevo valor de Xn para la siguiente iteración
         i=i+1;
    end
Xn=double(Xn);
    
end


