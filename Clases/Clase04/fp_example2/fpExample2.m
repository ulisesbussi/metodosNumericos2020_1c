%Ejemplo 1 Clase 03

f = @(x) x.^2-x -1 ;
x = 0:.05:3;

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[2,5],'k','LineWidth',1)

plot(x,f(x),'LineWidth',2.4)
%%

c_annot = annotation('textbox','interpreter','latex','String','$f(x)=e^{-x}-x$','FitBoxToText','on');
c_annot.FontSize=15;

g = @(x) f(x)+x;

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[0,3],'k','LineWidth',1)

plot(x,g(x),'LineWidth',2.4)
plot(x,x,'r','LineWidth',2)

c_annot = annotation('textbox','interpreter','latex','String','$g(x)=x^2-1$','FitBoxToText','on');
c_annot.FontSize=15;
a_annot = annotation('textbox','interpreter','latex','String','$y=x$','FitBoxToText','on');
a_annot.FontSize=15;





%% Iter 1
x0 =2;
x1 = g(x0);

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[0,3],'k','LineWidth',1)

plot(x,g(x),'LineWidth',2.4)
plot(x,x,'r','LineWidth',2)

plot(x0,x1,'om','MarkerSize',4,'LineWidth',4)
plot([x0,x0],[0,x1],'--k')


%% Iter 2
x2 = g(x1);

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[0,3],'k','LineWidth',1)

plot(x,g(x),'LineWidth',2.4)
plot(x,x,'r','LineWidth',2)

scatter(x1,x1,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
plot([x0 x1] ,[x1 x1],'--k') 
plot([x1 x1] ,[x1 x2],'--k') 
plot(x1,x2,'om','MarkerSize',4,'LineWidth',4)


%oldMarkers
plot([x0,x0],[0,x1],'--k')

scatter(x0,x1,'MarkerFaceColor','m','MarkerFaceAlpha',.5)

%% Iter 3
x3 = g(x2);
x=0:.1:10
figure()
hold on
grid on
plot([0,10],[0,0],'k','LineWidth',1)
plot([0,0],[0,100],'k','LineWidth',1)

plot(x,g(x),'LineWidth',2.4)
plot(x,x,'r','LineWidth',2)


scatter(x2,x2,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
plot([x1 x2] ,[x2 x2],'--k') 
plot([x2 x2] ,[x2 x3],'--k') 
plot(x2,x3,'om','MarkerSize',4,'LineWidth',4)


%oldMarkers
plot([x0,x0],[0,x1],'--k')
plot([x0 x1] ,[x1 x1],'--k') 
plot([x1 x1] ,[x1 x2],'--k')

scatter(x0,x1,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x1,x1,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x1,x2,'MarkerFaceColor','m','MarkerFaceAlpha',.5)

%% Iter 4
x4 = g(x3);

figure()
hold on
grid on
plot([0,3],[0,0],'k','LineWidth',1)
plot([0,0],[0,3],'k','LineWidth',1)

plot(x,g(x),'LineWidth',2.4)
plot(x,x,'r','LineWidth',2)


scatter(x3,x3,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
plot([x2 x3] ,[x3 x3],'--k') 
plot([x3 x3] ,[x3 x4],'--k') 
plot(x3,x4,'om','MarkerSize',4,'LineWidth',4)


%oldMarkers
plot([x0,x0],[0,x1],'--k')
plot([x0 x1] ,[x1 x1],'--k') 
plot([x1 x1] ,[x1 x2],'--k')
plot([x1 x2] ,[x2 x2],'--k') 
plot([x2 x2] ,[x2 x3],'--k') 

scatter(x0,x1,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x1,x1,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x1,x2,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x2,x2,'MarkerFaceColor','m','MarkerFaceAlpha',.5)
scatter(x2,x3,'MarkerFaceColor','m','MarkerFaceAlpha',.5)

%%
figure()
hold on
grid on
plot([0,5],[0,0],'k','LineWidth',1)
plot([0,0],[min(f(xs)),max(f(xs))],'k','LineWidth',1)

xs = [x0 x1 x2 x3 x4]
plot(1:5,f(xs),'-k','LineWidth',2.5)
scatter(1:5,f(xs),'MarkerFaceColor','k')

%%
figure()
hold on
grid on
plot([0,5],[0,0],'k','LineWidth',1)
plot([0,0],[min(f(xs)),max(f(xs))],'k','LineWidth',1)

xs = [x0 x1 x2 x3 x4]
plot(1:5,abs(f(xs)),'-k','LineWidth',2.5)
scatter(1:5,abs(f(xs)),'MarkerFaceColor','k')

