paso = .01;

x = 0:paso:5    ;
n = length(x);

f = @(x,y) sqrt(y) .* cos(x);

yAnalitica = @(x) ( sin(x)/2 +sqrt(5) ).^2;



% % EulerClasico
% y=5;
% for i=1:n-1
%     fi = f(x(i),y(i)); %es el valor de la derivada en el punto (y')
%     y(i+1) = y(i) + fi*paso;
% end


%% Método de Heun
yh = 5 ; %Solución con el método de Heun

for i=1:n-1
    fi = f(x(i),yh(i)); %es el valor de la derivada en el punto (y')
    yAux = yh(i) + fi*paso; %Predicción de Euler en i+1 y_{i+1}^0
    fi1= f(x(i+1),yAux); %<---Acá es donde importa yAux
    fm = (fi+fi1)/2;
    yh(i+1) = yh(i) + fm*paso;
end

%% Método de Euler de PuntoMedio
yE = 5 ; %Solución con el método de Euler pmedio
semiPaso = paso/2;

for i=1:n-1
    %Calcular una predicción en el punto medio
    fi = f(x(i),yE(i)); %es el valor de la derivada en el punto (y')
    yAuxMedio = yE(i) + fi*semiPaso; %Predicción de Euler en el punto medio
    
    %Calculo la derivada en el punto medio
    xMedio = x(i)+semiPaso; %(x(i) + x(i+1))/2; X del punto medio
    fpm= f(xMedio,yAuxMedio); %<---Acá es donde importa yAux
   
    %Calculo la función en el paso siguiente
    yE(i+1) = yE(i) + fpm*paso;
end



%%
figure()
hold on
plot(x,yAnalitica(x),'b')
plot(x,yh,'k')
plot(x,yE,'r')
legend('Solución Analítica','Solución Heun','Solución Euler Punto Medio')


%%
errorHeun = abs(yh-yAnalitica(x));
errorEulerM = abs(yE-yAnalitica(x));

figure()
hold on
plot(x,errorHeun,'k')
plot(x,errorEulerM,'r')
legend('Error Heun','Error Euler punto Medio')



