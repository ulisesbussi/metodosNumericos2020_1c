xT=1:15;
yT = 2*xT + 3 + 0.3* randn(1,15);

plot(xT,yT,'o','MarkerFaceColor','r')

idx = randperm(15);

x = xT(idx(1:10));
y = yT(idx(1:10));

xv = xT(idx(10+1:end));
yv = yT(idx(10+1:end));


f =figure()
plot(x,y,'o','MarkerFaceColor','r')
hold on
p = plot(xv,yv,'kx','MarkerFaceColor',[0.3,0,0],'LineWidth',2)
legend('Datos de Ajuste','Datos de Validación','Location','best')
n= length(x);
for i=1:8
    sx(i) = sum(x.^i);
    if i<=5
        sy(i) = sum(y.*x.^(i-1));
    end
end

A4 = [n    , sx(1), sx(2), sx(3), sx(4);
      sx(1), sx(2), sx(3), sx(4), sx(5);
      sx(2), sx(3), sx(4), sx(5), sx(6);
      sx(3), sx(4), sx(5), sx(6), sx(7);
      sx(4), sx(5), sx(6), sx(7), sx(8)];


b4= sy';

c4 = A4\b4;
c3 = A4(1:4,1:4)\b4(1:4);
c2 = A4(1:3,1:3)\b4(1:3);
c1 = A4(1:2,1:2)\b4(1:2);
  
rx = min(x):.5:max(x);

a1 = @(x) c1(1) + c1(2)*x;
a2 = @(x) c2(1) + c2(2)*x+c2(3)*x.^2;
a3 = @(x) c3(1) + c3(2)*x+c3(3)*x.^2 +c3(4)*x.^3 ;
a4 = @(x) c4(1) + c4(2)*x+c4(3)*x.^2 +c4(4)*x.^3 +c4(5)*x.^4;



figure()
hold on
plot(x,y,'o','MarkerFaceColor','r')
plot(rx,a1(rx),'LineWidth',2)
plot(rx,a2(rx),'LineWidth',2)
plot(rx,a3(rx),'LineWidth',2)
plot(rx,a4(rx),'LineWidth',2)
legend('Datos','Ajuste lineal','Grado 2','Grado 3','Grado 4','Location','best')


%% 
varX = var(x);
ra(1) = (varX-sum((y- a1(x)).^2))/varX;
ra(2) = (varX-sum((y- a2(x)).^2))/varX;
ra(3) = (varX-sum((y- a3(x)).^2))/varX;
ra(4) = (varX-sum((y- a4(x)).^2))/varX;

varV = var(xv);
rv(1) = (varV-sum((yv- a1(xv)).^2))/varV;
rv(2) = (varV-sum((yv- a2(xv)).^2))/varV;
rv(3) = (varV-sum((yv- a3(xv)).^2))/varV;
rv(4) = (varV-sum((yv- a4(xv)).^2))/varV;

figure()
hold on
plot(ra,'LineWidth',2)
legend('r^2 sobre datos ajustados','Location','best')
plot(rv,'LineWidth',2)
legend('r^2 sobre datos ajustados','r^2 sobre datos de validación','Location','best')
