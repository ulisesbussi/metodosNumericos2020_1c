clc
clear all


p(1)=30;
c(1)=3;
h=0.01;  %paso
tf=300;
t=(0:h:tf);

[p1,c1]=RK3(p(1),c(1),h,tf);   %p1 seria la poblacion de presas y c1 la de cazadores hecho por runge-kutta3
[p2,c2]=RK4(p(1),c(1),h,tf);   %p2 seria la poblacion de presas y c2 la de cazadores hecho por runge-kutta4
[p3,c3]=Euler(p(1),c(1),h,tf); %p3 seria la poblacion de presas y c3 la de cazadores hecho por euler


    %Aca empieza el graficado bien
    
 axes('FontSize',16)
 plot(t,p1,'-g*',t,p2,'r',t,p3,t,c1,'-bv',t,c2,'c',t,c3)
 grid on
 xlabel('Tiempo')
 ylabel('Poblacion')
%  ylim([min([p1,p2,c1,c2]) max([p1,p2,c1,c2])])
%  xlim([0 tf])
 title(['Proporcion de cazadores y presas en el tiempo'])
 legend('Presas RK3','Presas RK4','Presas Euler','Cazadores RK3','Cazadores RK4','Cazadores Euler')