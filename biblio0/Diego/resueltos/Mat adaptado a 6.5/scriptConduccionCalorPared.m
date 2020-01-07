%Script de la conducción del calor en una pared con tres espesores y tres k

clc
clear all

E = [5, 3.5, 2.5];  %Espesores de las capas de la pared
K = [50, 30, 70];   %Coef. de conductividad del calor de los espesores

y0 = 100;           %Temp. fija del lado izquierdo de la pared (Dir. 1)
yn = 35;            %Temp. que alcanza el lado derecho de la pared (Dir. 2)

h = 1e-2;           %Paso para el método

X = (0:h:11);       %Vector X
n = length(X);
kx = NaN(size(X) -1);


for i=1:n-1         %Construcción de k(x) de acuerdo al espesor correspondiente
    if X(i)< E(1)
        kx(i) = K(1);
    else
        if X(i)< E(1) + E(2)
            kx(i) = K(2);
        else
            kx(i) = K(3);
        end
    end
end


mat1 = -2*eye(n-1) + diag(ones(n-2,1),1) + diag(ones(n-2,1),-1); %Matriz del sistema

yAux = zeros(n-1,1);  %Vector de temperaturas dato
yAux(1) = y0;
yAux(n-1) = yn;

Y = NaN(n-1,1);     %Prealocación de vectores
Z = NaN(size(Y));



%Resolución del sistema por Thomas

[L,U] = algoritmoThomas(mat1);


% %Descenso Thomas
% 
%     Z(1) = (((-h^2)/fx(1)) - yAux(1)) / L(1,1);    
%     for i=2:n-1
%         Z(i) = (((-h^2)/fx(i)- yAux(i)) - Z(i-1)*L(i,i-1)) / L(i,i);
%     end
% 
% 
% %Remonte Thomas
% 
%     Y(n-1) = Z(n-1) / U(n-1,n-1);  
%     for i=n-2:-1:1
%         Y(i) = (Z(i) - Y(i+1)*U(i+1,i)) / U(i,i);
%     end
    
%Descenso Thomas

    Y(1) = (((-h^2)/kx(1)) - yAux(1)) / L(1,1);    
    for i=2:n-1
        Y(i) = ((((-h^2)/kx(i)) - yAux(i)) - Y(i-1)*L(i,i-1)) / L(i,i);
    end


%Remonte Thomas

    Y(n-1) = Y(n-1) / U(n-1,n-1);  
    for i=n-2:-1:1
        Y(i) = (Y(i) - Y(i+1)*U(i,i+1)) / U(i,i);
    end




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
    'DisplayName','distr. calor');

% Create xlabel
xlabel({'pared'},'FontSize',13);

% Create ylabel
ylabel({'temperatura'},'FontSize',13);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',13);

