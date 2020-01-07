syms x    %declaramos a X una variable simbólica
Y=x*x*x-9;  %se solicita la entrada de la función

n=50;

%graficamos la función en un intervalo para poder tomar una buena
%estimación de la raíz
sup = 10;
in = -10;
t = linspace(in,sup,500);    %generamos un vector con los valores
plot(t,subs(Y,t))               %generamos la gráfica
grid on

xn(1)= 0;
xn(2)= 5;
for i=2:n-2
cosos =  (xn(i) - xn(i-1)) / ( subs(Y,xn(i))-subs(Y,xn(i-1)));    
coso = cosos*subs(Y,xn(i));
xn(i+1)= xn(i) - coso;  
    
end