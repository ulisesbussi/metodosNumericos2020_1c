paso = .5;

x = 0:paso:5;
n = length(x);

f = @(x,y) x.^2 -3.5*x+2.5;

yAnalitica = @(x) x.^3 /3 - 3.5*x.^2 /2 +2.5*x +5;

y=5;


for i=1:n-1
    fi = f(x(i),y(i)); %es el valor de la derivada en el punto (y')
    y(i+1) = y(i) + fi*paso;
end



yh = 5 ; %Solución con el método de Heun

for i=1:n-1
    fi = f(x(i),yh(i)); %es el valor de la derivada en el punto (y')
    yAux = yh(i) + fi*paso; %Predicción de Euler en i+1 y_{i+1}^0
    fi1= f(x(i+1),yAux); %<---Acá es donde importa yAux
    fm = (fi+fi1)/2;
    yh(i+1) = yh(i) + fm*paso;

end

figure()
plot(x,yAnalitica(x))
hold on
plot(x,y,'r')
plot(x,yh,'k')
legend('Solución Analítica','Solución Euler','Solución Heun')


errorEuler = y-yAnalitica(x);
errorHeun  = yh-yAnalitica(x);
figure()
hold on
plot(x,errorEuler,'r')
plot(x,errorHeun,'k')
legend('Error Euler','Error Heun')
