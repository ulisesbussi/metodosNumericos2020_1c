xr = 0:.1:3.5;
f = @(x) -(x-3.1).^2 +2 ;
f1 = @(x)  2.2*(x-2) +f(2)
figure(1)
hold on
grid on
plot(xr,f(xr),'b','LineWidth',2)
plot(1.5:2.5,f1(1.5:2.5),'r--','LineWidth',2)
legend('Curva','Derivada Real','Location','best')
xlim([-0.5,4])
ylim([-5,2.5])

x = 1:3;
y = f(x);

plot(x,y,'ok','MarkerFaceColor','k')

%%

plot(2:3,f(2:3),'k','LineWidth',1.5)
plot(1:2,f(1:2),'k','LineWidth',1.5)



plot([1,3],f([1,3]),'k','LineWidth',1.5)