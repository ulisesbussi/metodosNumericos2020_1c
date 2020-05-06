x = [1 2 3 4];
y = [1 5 3 4];

figure(1)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])
%sc1.MarkerFaceAlpha = .2;
%sc1.MarkerEdgeAlpha = .2;


figure(1)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])
sc1.MarkerFaceAlpha = .2;
sc1.MarkerEdgeAlpha = .2;
sc2 = scatter(x(1:2),y(1:2),'o','MarkerFaceColor','r')
plot(x(1:2),y(1:2),'b','LineWidth',2)
%%
figure(2)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])
sc1.MarkerFaceAlpha = .2;
sc1.MarkerEdgeAlpha = .2;
plot(x(1:2),y(1:2),'b','LineWidth',2)

sc2 = scatter(x(2:3),y(2:3),'o','MarkerFaceColor','r')

plot(x(2:3),y(2:3),'b','LineWidth',2)

%%

figure(3)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])
sc1.MarkerFaceAlpha = .2;
sc1.MarkerEdgeAlpha = .2;
plot(x(1:2),y(1:2),'b','LineWidth',2)
plot(x(2:3),y(2:3),'b','LineWidth',2)

sc2 = scatter(x(3:4),y(3:4),'o','MarkerFaceColor','r')

plot(x(3:4),y(3:4),'b','LineWidth',2)

%%

figure(4)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,5.5])

plot(x(1:2),y(1:2),'b','LineWidth',2)
plot(x(2:3),y(2:3),'b','LineWidth',2)
plot(x(3:4),y(3:4),'b','LineWidth',2)
sc2 = scatter(x,y,'o','MarkerFaceColor','r')




