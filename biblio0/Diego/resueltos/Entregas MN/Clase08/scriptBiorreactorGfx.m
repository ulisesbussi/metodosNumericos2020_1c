%Script del gráfico de las curvas de concentración de reactivo en el
%biorreactor

    clc
    clear all
    
    theta = 0;
    n = [5 10 20 50 100];
    
    [X1,Y1] = curvaBiorreactorPorTheta(n(1), theta);
    [X2,Y2] = curvaBiorreactorPorTheta(n(2), theta);
    [X3,Y3] = curvaBiorreactorPorTheta(n(3), theta);
    [X4,Y4] = curvaBiorreactorPorTheta(n(4), theta);
    [X5,Y5] = curvaBiorreactorPorTheta(n(5), theta);
    
    fc = @(t) 1/4 + (3/4)*exp(-0.4*t);  %funcion "real" de la concentración del reactivo
    
    plot(X1,Y1,'g-',X2,Y2,'r-',X3,Y3,'c-',X4,Y4,'m-',X5,Y5,'b-');
    hold on
    fplot(fc, [0 30],'k:');
    hold off