ini=-5;
fini=-1;
paso=5;
tf=30;

hvec=logspace(ini,fini,paso);

EDO
Kutta34
Kutta
ode45(@bioreac2,t,1);


loglog(hvec,ECEM,'LineWidth',2,'DisplayName','Euler Modificado');
ylim([1e-17 1e-2])
hold all;
loglog(hvec,EMEJ,'--','LineWidth',2,'DisplayName','Euler Mejorado');
loglog(hvec,ERK3,'LineWidth',2,'DisplayName','Runge Kutta 3');
loglog(hvec,ERK4,'LineWidth',2,'DisplayName','Runge Kutta 4');
loglog(hvec,ECER,'LineWidth',2,'DisplayName','Euler Regresivo');
loglog(hvec,ECET,'LineWidth',2,'DisplayName','Theta');
loglog(hvec,ECEP,'--','LineWidth',2,'DisplayName','Euler Progresivo');
hold off;
figure(gcf);



