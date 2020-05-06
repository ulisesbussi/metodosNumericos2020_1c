    x = [1 2 3 4];
y = [1 5 3 4];

figure()
hold on
plot(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])


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
plot(x,y,'o','MarkerFaceColor','r')
legend('Polinomio de Lagrange','Datos','Location','best')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])
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