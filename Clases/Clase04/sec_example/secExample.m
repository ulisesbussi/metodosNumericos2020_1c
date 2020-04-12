%Ejemplo 4 Clase 03

f = @(x) x.^2 -x -1;
f1 = @(x) 2.*x -1;
x = 0:.05:3;

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[min(f(x)),max(f(x))],'k','LineWidth',1)

plot(x,f(x),'LineWidth',2.4)


c_annot = annotation('textbox','interpreter','latex','String','$f(x)=x^2-x-1$','FitBoxToText','on');
c_annot.FontSize=15;


iter = @(x0,x1) x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));

%% Iter 1
x00 =2.1;
x0 =2;
x1 = iter(x00,x0);

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[0,3],'k','LineWidth',1)

plot(x,f(x),'LineWidth',2.4)


scatter(x0,f(x0),'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x00,f(x00),'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x1,0,'MarkerFaceColor','m')

plot([x00,x1],[f(x00),0],'--k')

%% Iter 2
x2 = iter(x0,x1);

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[0,3],'k','LineWidth',1)

plot(x,f(x),'LineWidth',2.4)

scatter(x1,f(x1),'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x2,0,'MarkerFaceColor','m')
plot([x0,x2],[f(x0),0],'--k')


scatter(x0,f(x0),'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x1,0,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
plot([x0,x1],[f(x0),0],'--k')

