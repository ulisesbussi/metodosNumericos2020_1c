%Errores para los métodos eP, eR, RK2,3,4 para el ejercicio del biorreactor

clc
clear all

fc = @(t) 1/4 + (3/4)*exp(-0.4*t);          %Función de la concentración analítica
ft = @(c) log((c - 1./4).*4./3)./(-0.4);    %Tiempo en funcion de la concentracion
tau = 1.7;          %Valor cercano al tiempo medio del decaimiento de c

n = 50;

h = logspace(-4,-1,n);


tIni = 0;
tMax = 2;


error = NaN(8,n);
tiempos = NaN(8,n);

for i=1:n
    

    X = (tIni:h(i):tMax);      %Vector de tiempos
    Y = NaN(size(X));          %Prealocación del vector de concentraciones

    time = round(tau/h(i));    %Tiempo en que se va a evaluar el error
    real = fc(X(time));        %Valor analítico de la concentración
    
    tic;
    Y = funcionBiorreactorEulerProg_sinf1(X);       %Euler prog.
    tiempos(1,i) = toc;
    error(1,i) = abs(Y(time) - real);
    
    tic;
    Y = funcionBiorreactorEulerReg(X);              %Euler reg.
    tiempos(2,i) = toc;
    error(2,i) = abs(Y(time) - real);
     
    tic;
    Y = funcionBiorreactorThetaM_2_sinf1(X,1/2);    %Theta-M.
    tiempos(3,i) = toc;
    error(3,i) = abs(Y(time) - real);
    
    tic;
    Y = funcionBiorreactorRK2_2_sinf1(X);           %Runge Kutta 2
    tiempos(4,i) = toc;
    error(4,i) = abs(Y(time) - real);
    
    tic;
    Y = funcionBiorreactorRK3_2_sinf1(X);           %Runge Kutta 3
    tiempos(5,i) = toc;
    error(5,i) = abs(Y(time) - real);
    
    tic;
    Y = funcionBiorreactorRK4_2_sinf1(X);           %Runge Kutta 4
    tiempos(6,i) = toc;
    error(6,i) = abs(Y(time) - real);
    
    tic;
    Y = funcionBiorreactorAB3_sinf1(X);             %Adams-Bashford 3
    tiempos(7,i) = toc;
    error(7,i) = abs(Y(time) - real);
    
    tic;
    Y = funcionBiorreactorAM4_sinf1(X);             %Adams-Moulton 4
    tiempos(8,i) = toc;
    error(8,i) = abs(Y(time) - real);
    
end


%Gráfico
 
figure1 = figure;
axes1 = axes('Parent',figure1,...
    'ZColor',[0.04 0.14 0.42],...
    'YScale','log',...
    'YMinorTick','on',...
    'YMinorGrid','on',...
    'YColor',[0.04 0.14 0.42],...
    'XScale','log',...
    'XMinorTick','on',...
    'XMinorGrid','on',...
    'XColor',[0.04 0.14 0.42],...
    'FontSize',11,...
    'Color',[0.86 0.86 0.86]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');

loglog1 = loglog(h,error,'Parent',axes1,'LineWidth',1.5);
set(loglog1(1),'DisplayName','eProg');
set(loglog1(2),'Color',[0 0.5 0],'DisplayName','eReg');
set(loglog1(3),'Color',[1 0 0.2],'DisplayName','theta-M');
set(loglog1(4),'Color',[0 1 0],'DisplayName','RK2');
set(loglog1(5),'DisplayName','RK3');
set(loglog1(6),'Color',[1 1 0],'DisplayName','RK4');
set(loglog1(7),'Color',[1 0.5 0],'DisplayName','AB3');
set(loglog1(8),'Color',[0.5 0.2 0.9],'DisplayName','AM4');

xlabel('h','FontSize',13,'Color',[0.04 0.14 0.42]);

ylabel('error absoluto','FontSize',13,'Color',[0.04 0.14 0.42]);

title('Errores vs h','FontSize',14);

legend1 = legend(axes1,'show');
set(legend1,'Position',[0.78 0.12 0.10 0.25],'Color',[0.849 0.8 0.73]);




figure2 = figure;
axes2 = axes('Parent',figure2,...
    'ZColor',[0.04 0.14 0.42],...
    'YScale','log',...
    'YMinorTick','on',...
    'YMinorGrid','on',...
    'YColor',[0.04 0.14 0.42],...
    'XScale','log',...
    'XMinorTick','on',...
    'XMinorGrid','on',...
    'XColor',[0.04 0.14 0.42],...
    'FontSize',11,...
    'Color',[0.86 0.86 0.86]);
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'all');

loglog1 = loglog(h,tiempos,'Parent',axes2,'LineWidth',1.0);
set(loglog1(1),'DisplayName','eProg');
set(loglog1(2),'Color',[0 0.5 0],'DisplayName','eReg');
set(loglog1(3),'Color',[1 0 0.2],'DisplayName','theta-M');
set(loglog1(4),'Color',[0 1 0],'DisplayName','RK2');
set(loglog1(5),'DisplayName','RK3');
set(loglog1(6),'Color',[1 1 0],'DisplayName','RK4');
set(loglog1(7),'Color',[1 0.5 0],'DisplayName','AB3');
set(loglog1(8),'Color',[0.5 0.2 0.9],'DisplayName','AM4');

xlabel('h','FontSize',13,'Color',[0.04 0.14 0.42]);

ylabel('tiempo (s)','FontSize',13,'Color',[0.04 0.14 0.42]);

title('Tiempos vs h','FontSize',14);

legend2 = legend(axes2,'show');
set(legend2,'Position',[0.76 0.59 0.19 0.39],'Color',[0.849 0.8 0.73]);
