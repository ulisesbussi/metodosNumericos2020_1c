%Curve Fitting

%ejemplos residual lineal

a = [1 2];
b = [2 4];
hf = figure
hold on
plot(a,b,'ok','MarkerFaceColor','k')
plot([1,2],[2,4],'b','LineWidth',2)
plot([1,2],[3,3],'r','LineWidth',2)
lgd = legend('Datos','y_1 = 2x','y_2=3','Location','best')
lgd.FontSize=12
xlim([0.8,2.2])
ylim([1.8,4.2])
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);

%%
%ejemplos residual lineal

a = [1 2 3 4 5 6];
b = [4 4 4 -7 4 4];
hf = figure
hold on
plot(a,b,'ok','MarkerFaceColor','k')
plot([1,6],[mean(b),mean(b)],'b','LineWidth',2)

f =@(x) -0.3143*x+3.26;
plot(a,f(a))

xlim([0.8,6.2])
ylim([-8,4.5])
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);





%% Least-Squares

%f = @(x) 2*x + 1 + 2*randn(size(x));
f = @(x) 2*x + 1;
x   =  [1 2 3 4 5 6 7];
y  =  [3.93 4.58 8.25 9.36 8.94 14.89 15.61];
figure()
plot(x,y,'or','MarkerFaceColor','r')

n=length(x);
sx = sum(x); 
sy = sum(y);
mx = mean(x);
my = mean(y);
sx2 = sum(x.^2);
sxy = sum(x.*y);

a = (n*sxy - sx*sy) / (n*sx2 - sx^2);
b = my - a*mx;
hf = figure()
hold on
plot(x,y,'or','MarkerFaceColor','r')
plot(x,a*x+b,'b','LineWidth',2)
lgd = legend('DataPoints', 'y =2.0125 x +1.31','Location','best' )
lgd.FontSize=12
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);


%%
hf = figure(3)
hold on
plot(x,y,'or','MarkerFaceColor','r')
plot([x(1),x(end)],[my,my],'b','LineWidth',2)
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);

%%  Linealizacion exponencial

x=1:.1:2;
f = @(x) 2* exp(2*x);
hf = figure()
plot(x,f(x),'LineWidth',2)
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);
xlabel('x')
ylabel('y')

hf = figure()
plot(x,log(f(x)),'LineWidth',2)
xlabel('x')
ylabel('ln(y)')
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);

%%  Linealizacion potencia

x=1:.1:5;
f = @(x) 3* x.^2;
hf = figure()
plot(x,f(x),'LineWidth',2)
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);
xlabel('x')
ylabel('y')

hf = figure()
plot(log(x),log(f(x)),'LineWidth',2)
xlabel('ln(x)')
ylabel('ln(y)')
grid on
set(get(hf,'CurrentAxes'),'GridAlpha',0.6);



%%

x = [2 4];
y = [4 8];
hf =figure()
hold on
plot(x,y,'or','MarkerFaceColor','r')
plot(x,y,'k','LineWidth',1.5)
plot(x,[y(1),y(1)],'k')
plot([x(2),x(2)],y,'k')
plot(3,6,'og','MarkerFaceColor','g')
plot([x(1),x(1)],[y(1),6],'r')
plot([x(1),3],[6,6],'r')

