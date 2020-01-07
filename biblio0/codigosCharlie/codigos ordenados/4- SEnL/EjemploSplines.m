%parcial práctic

clc
clear all

%datos tray. paramétrica del robot sobre el plano
t = (0:3:30);
X = [0.05 0.15 0.27 0.08 -0.14 -0.03 -0.05 0.05 0.15 0.27 0.11 ];
Y = [0.32 0.17 0.04 -0.02 0.07 0.18 0.32 0.32 0.17 0.04 0.23];


%Reconstrucción trayectoria suave
h = 0.001;
t2 = (0:h:30);

X2 = spline(t,X,t2);
Y2 = spline(t,Y,t2);

n = length(X2);


%cálculo derivada primera de tray. (velocidad)

vX = NaN(size(X2));
vY = NaN(size(Y2));

for i=1:2
    vY(i) = (-3*Y2(i) + 4*Y2(i+1) - Y2(i+2)) / (2*h);
    vX(i) = (-3*X2(i) + 4*X2(i+1) - X2(i+2)) / (2*h);
end

for i=3:n
    vY(i) = (Y2(i-2) - 4*Y2(i-1) + 3*Y2(i)) / (2*h);
    vX(i) = (X2(i-2) - 4*X2(i-1) + 3*X2(i)) / (2*h);
end


%cálculo velocidad total máxima

vTot = @(vXi,vYi) (vXi.^2 + vYi.^2).^(1./2);

vMAX = vTot(vX(1),vY(1));

for i=2:n
    if vMAX < vTot(vX(i),vY(i))
        vMAX = vTot(vX(i),vY(i));
    end
end


%gráfico velocidad en y vs tiempo

    % Create figure
    figure1 = figure;

    % Create axes
    axes1 = axes('Parent',figure1);
    box(axes1,'on');
    hold(axes1,'all');

    % Create plot
    plot(t2,vY,'Color',[1 0 0]);

    % Create xlabel
    xlabel('tiempo (s)');

    % Create ylabel
    ylabel('velocidad en Y (m/s)');
    
    %plot(t2,Y2);

    
%Gráfico velocidad en x vs tiempo

    % Create figure
    figure2 = figure;

    % Create axes
    axes1 = axes('Parent',figure2);
    box(axes1,'on');
    hold(axes1,'all');

    % Create plot
    plot(t2,vX,'Color',[0 0 1]);

    % Create xlabel
    xlabel('tiempo (s)');

    % Create ylabel
    ylabel('velocidad en X (m/s)');
    
    %plot(t2,X2);

