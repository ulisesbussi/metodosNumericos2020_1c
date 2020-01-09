%Puntos de la gráfica


tension   = [0 0.8471 1.788 2.729 3.671 4.612 ...
             5.553 6.494 7.435 8.376 9.318 10.26...
             11.2 12.14 13.08 14.02 14.96 15.91 16.85 17.79...
             18.73 19.67 20.61 21.55 22.49 23.44];
velocidad = [.003851 .003851 .003851 .003851 .003851 .003851...
             0.5464 1.963 3.143 4.091 4.824 5.983 6.342 6.892...
             7.502 7.651 8.089 8.244 8.55 8.949...
             8.909 9.156 9.443 9.52 9.701 9.843];
         
figure(2)
plot(tension,velocidad,'*')
hold on


Ajuste_Smooth = fit(tension',velocidad','smoothingspline');
Estructura_Smooth = coeffvalues(Ajuste_Smooth);
tension_Completo= 0:0.1:24;
Dots=feval(Ajuste_Smooth,tension_Completo);

plot(tension_Completo,Dots,'r')

%Ajuste_Exp = fit(tension(7:length(tension))',velocidad(7:length(velocidad))','exp1');
%Estructura_Exp = coeffvalues(Ajuste_Exp);
tension_Completo= 5:0.1:24;

%Dots_Exp=feval(Ajuste_Exp,tension_Completo);
Dots_Exp_man=10 - 10*exp(-.165*(tension_Completo-5));
plot(tension_Completo,Dots_Exp_man,'c')

Ajuste_Cuad = fit(tension(7:length(tension))',velocidad(7:length(velocidad))','poly2');
Estructura_Cuad = coeffvalues(Ajuste_Cuad);
Dots_Cuad=feval(Ajuste_Cuad,tension_Completo);
plot(tension_Completo,Dots_Cuad,'g')

Ajuste_Lineal1 = fit(tension(7:12)',velocidad(7:12)','poly1');
Estructura_Lineal1 = coeffvalues(Ajuste_Lineal1);
Dots_Lineal1=feval(Ajuste_Lineal1,tension_Completo);
plot(tension_Completo,Dots_Lineal1,'k')

Ajuste_Lineal2 = fit(tension(13:18)',velocidad(13:18)','poly1');
Estructura_Lineal2 = coeffvalues(Ajuste_Lineal2);
Dots_Lineal2=feval(Ajuste_Lineal2,tension_Completo);
plot(tension_Completo,Dots_Lineal2,'k')

Ajuste_Lineal3 = fit(tension(19:27)',velocidad(19:27)','poly1');
Estructura_Lineal3 = coeffvalues(Ajuste_Lineal3);
Dots_Lineal3=feval(Ajuste_Lineal3,tension_Completo);
plot(tension_Completo,Dots_Lineal3,'k')
