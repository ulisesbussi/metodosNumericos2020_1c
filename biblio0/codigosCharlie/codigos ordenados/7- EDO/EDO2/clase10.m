%clase10
%bioreactor perfectamente agitado
clc
clear all
close all 
%funciones del bioreactor
ana=f1c6;
Dif=f2c7;
c0=1;
theta=(1/2);
alpha=(1/2);

%vector X
inicio=0;
fin=30;
paso=[1 0.1  0.01 0.001 0.0001];

%vectores de tiempo y de errores
TimeAna=NaN(size(paso));
TimePro=NaN(size(paso));
TimeReg=NaN(size(paso));
TimeThe=NaN(size(paso));
TimeEuMe=NaN(size(paso));
TimeRk3=NaN(size(paso));
TimeRk4=NaN(size(paso));
TimeAdam=NaN(size(paso));
TimeAdMouPre=NaN(size(paso));

ErrThe=NaN(size(paso));
ErrPro=NaN(size(paso));
ErrReg=NaN(size(paso));
ErrRk3=NaN(size(paso));
ErrRk4=NaN(size(paso));
ErrAdam=NaN(size(paso));
ErrEuMe=NaN(size(paso));
ErrAdMouPre=NaN(size(paso));

for i=1:length(paso)
    
X=inicio:paso(i):fin;

%vector de soluciones
tic;
YThe=thetaMetodo(X,Dif,paso(i),theta,c0);
TimeThe(i)=toc;

tic;
YPro=eulerProgresivo(Dif,X,c0,paso(i));
TimePro(i)=toc;

tic;
YReg=eulerRegresivo(X,paso(i),c0);
TimeReg(i)=toc;

tic;
YRk3=MetRk3(Dif,X,c0,paso(i));
TimeRk3(i)=toc;

tic;
YRk4=MetRk4(Dif,X,c0,paso(i));
TimeRk4(i)=toc;

tic;
YAdam=adamsBashforth(X,paso(i),Dif,c0);
TimeAdam(i)=toc;

tic;
YAna=solAna(ana,X,c0);
TimeAna(i)=toc;

tic;
YEuMe=eulerMejorado(Dif,X,c0,paso(i),alpha);
TimeEuMe(i)=toc;

tic;
YAdMouPre=AdamMoutonPredictor(Dif,paso(i),YAdam);
TimeAdMouPre=toc;

%errores de las funciones
ErrThe(i)=errorTotal(YAna,YThe);
ErrPro(i)=errorTotal(YAna,YPro);
ErrReg(i)=errorTotal(YAna,YReg);
ErrRk3(i)=errorTotal(YAna,YRk3);
ErrRk4(i)=errorTotal(YAna,YRk4);
ErrAdam(i)=errorTotal(YAna,YAdam);
ErrEuMe(i)=errorTotal(YAna,YEuMe);
ErrAdMouPre(i)=errorTotal(YAna,YAdMouPre);

disp('fin del for')
i
end

figure(1)
plot(X,YAna,'b')
hold on
title('funciones Resueltas')
ylabel('Concentracion del reactor')
xlabel('Tiempo en minutos')
grid on
plot(X,YPro,'m')
plot(X,YReg,'c')
plot(X,YThe,'-.b')
plot(X,YEuMe,'-.r')
plot(X,YRk3,':r')
plot(X,YRk4,'r')
plot(X,YAdam,'y')
plot(X,YAdMouPre,'-.y')
legend('Analitica','Euler Progresivo','Euler Regresivo','Theta Metodo','Euler Mejorado','Runge Kutta 3','Runge Kutta 4','Adams Bashforth','Adams Moulton predictor')

figure(2)
loglog(paso,ErrPro,'m')
hold on
title('Errores')
ylabel('Error')
xlabel('Paso')
grid on
loglog(paso,ErrReg,'c')
loglog(paso,ErrThe,'-.b')
loglog(paso,ErrEuMe,'-.r')
loglog(paso,ErrRk3,':r')
loglog(paso,ErrRk4,'r')
loglog(paso,ErrAdam,'y')
loglog(paso,ErrAdMouPre,'-.y')
legend('Euler Progresivo','Euler Regresivo','Theta Metodo','Euler Mejorado','Runge Kutta 3','Runge Kutta 4','Adams Bashforth','Adams Moulton predictor')

figure(3)
loglog(paso,TimePro,'m')
hold on
title('Tiempos')
ylabel('Tiempo')
xlabel('Paso')
grid on
loglog(paso,TimeReg,'c')
loglog(paso,TimeThe,'-.b')
loglog(paso,TimeEuMe,'-.r')
loglog(paso,TimeRk3,':r')
loglog(paso,TimeRk4,'r')
loglog(paso,TimeAdam,'y')
loglog(paso,TimeAdMouPre,'-.y')
legend('Euler Progresivo','Euler Regresivo','Theta Metodo','Euler Mejorado','Runge Kutta 3','Runge Kutta 4','Adams Bashforth','Adams Moulton predictor')