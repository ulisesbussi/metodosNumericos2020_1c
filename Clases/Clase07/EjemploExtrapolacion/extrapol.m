%x = 1:.5:3;
xr = 1:.1:4;
f =@(x) 2*x.^2 -5*x - 1 + .4*randn(1,length(x));
%y = f(x);
%yr = f(xr);
yr = [-4.0533 -4.3658 -3.5794 -4.2099 -4.3156 -4.1175 -4.2192 -4.1681 ...
      -2.5096 -2.6178 -2.8770 -3.1828 -2.6662 -1.9906 -1.1634 -1.5328 ...
      -1.4119 -0.4996 0.8134 1.4765 2.1807 2.6679 3.5535 4.0895 5.4648 ...
      5.4553 7.1020 7.5405 8.7460 10.1411 11.4156];
x = xr(1:5:25);
y = yr(1:5:25);


figure(2)
plot(xr,yr,'--','LineWidth',2)
hold on
plot(x,y,'o','MarkerFaceColor','r')
legend('Curva de datos', 'Muestras para interpolación')
%%

Ls = createWeights(x);
poly = @(x) 0;
for i=1:length(Ls)
   poly = @(x) poly(x) + Ls{i}(x).*y(i);
end
%%
x_interp = 1:.1:4;
y_interp = poly(x_interp)
figure()
hold on
plot(x_interp,y_interp,'b','LineWidth',2)
plot(xr,yr,'--','LineWidth',2)
plot(x,y,'o','MarkerFaceColor','r')
legend('Polinomio de Lagrange','Curva original','Datos','Location','best')
grid on
ax = gca;
ax.GridAlpha =.4;

%%
x_interp = 1:.1:4;
y_interp = poly(x_interp)
figure()
hold on
plot(x_interp,y_interp,'b','LineWidth',2)
plot(xr,yr,'--','LineWidth',2)
plot(x,y,'o','MarkerFaceColor','r')
legend('Polinomio de Lagrange','Curva original','Datos','Location','best')
grid on
ax = gca;
ax.GridAlpha =.4;

plot([4 4],[-6,y_interp(end)],'k--')
plot([4],[yr(end)],'o','MarkerFaceColor','g')
plot([4],[y_interp(end)],'o','MarkerFaceColor','g')

%%




function Ls = createWeights(x)
    n = length(x);
    for i =1:n
        Ls{i}= @(varin) 1;
        for j =1:n
            if j~=i
                Ls{i} = @(varin) Ls{i}(varin) .*(varin-x(j))./(x(i)-x(j));
            end
        end
    end
end