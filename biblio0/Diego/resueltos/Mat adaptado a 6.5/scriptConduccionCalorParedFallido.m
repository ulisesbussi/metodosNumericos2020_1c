%Script de la conducción del calor en una pared con tres espesores y tres k

clc
clear all

% E = [5, 3.5, 2.5];  %Espesores de las capas de la pared
% K = [50, 30, 70];   %Coef. de conductividad del calor de los espesores

y0 = 100;           %Temp. fija del lado izquierdo de la pared (Dir 1)
yn = 35;            %Temp. que alcanza el lado derecho de la pared (Dir 2)

h = 1e-3;           %Paso para el método

X = (0:h:11);       %Vector X
n = length(X);

fx = @(x) (-500 - (1950/11)*x) / -k(x); 

mat1 = -2*eye(n-1) + diag(ones(n-2,1),1) + diag(ones(n-2,1),-1); %Matriz del sistema

yAux = zeros(n-1,1);  %Vector de temperaturas dato
yAux(1) = y0;
yAux(n-1) = yn;

Y = NaN(n-1,1);     %Prealocación de vectores
Z = NaN(size(Y));



%Resolución del sistema por Thomas

[L,U] = algoritmoThomas(mat1);

    
%Descenso Thomas
    
    
    Y(1) = ((-h^2)/k(X(1)))*fx(X(1)) - yAux(1);
    for i=2:n-1
        Y(i) = (((-h^2)/k(X(i)))*fx(X(i)) - yAux(i)) - Y(i-1)*L(i,i-1);
    end


%Remonte Thomas

    Y(n-1) = Y(n-1) / U(n-1,n-1);  
    for i=n-2:-1:1
        Y(i) = (Y(i) - Y(i+1)*U(i,i+1)) / U(i,i);
    end

% gx = @(x) 100 - (65./11).*x;


Y(n) = yn;
%graficoLinealSimple(X,Y,'pared','temperatura','distr. calor');
% hold on
% fplot(gx, [0 11],'r');
% hold off

Y(n) = yn;
%plot(X,Y)

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,...
    'XTickLabel',{'lado izq.','e1-e2','e2-e3','lado der.'},...
    'XTick',[0 5 8.5 11],...
    'FontSize',12);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');

% Create plot
plot(X,Y,'Parent',axes1,'LineWidth',1.5,'Color',[1 0 0],...
    'DisplayName','temp. interior');

% Create xlabel
xlabel({'interior pared'},'FontSize',13);

% Create ylabel
ylabel({'temperatura'},'FontSize',13);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',13);



