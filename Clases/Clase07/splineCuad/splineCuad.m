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
%%

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

a1=1;c1=0;b1=4;
x1=1;x2=2;
rx = x1:.1:x2;
f = @(x) a1 +b1*(x-x1) + c1*(x-x1).^2;
plot(rx,f(rx),'b','LineWidth',2)
%%
figure(2)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,6])
sc1.MarkerFaceAlpha = .2;
sc1.MarkerEdgeAlpha = .2;
a1=1;c1=0;b1=4;
x1=1;x2=2;
rx = x1:.1:x2;
f = @(x) a1 +b1*(x-x1) + c1*(x-x1).^2;
plot(rx,f(rx),'b','LineWidth',2)


sc2 = scatter(x(2:3),y(2:3),'o','MarkerFaceColor','r')

a1=5;b1=4;c1=-6;
x1=2;x2=3;
rx = x1:.1:x2;
f = @(x) a1 +b1*(x-x1) + c1*(x-x1).^2;
plot(rx,f(rx),'b','LineWidth',2)

%%
figure(3)
hold on
sc1 = scatter(x,y,'o','MarkerFaceColor','r')
grid on
ax = gca;
ax.GridAlpha =.4;
xlim([0.5,4.5])
ylim([0.5,6])
sc1.MarkerFaceAlpha = .2;
sc1.MarkerEdgeAlpha = .2;

a1=1;c1=0;b1=4;
x1=1;x2=2;
rx = x1:.1:x2;
f = @(x) a1 +b1*(x-x1) + c1*(x-x1).^2;
plot(rx,f(rx),'b','LineWidth',2)

a1=5;b1=4;c1=-6;
x1=2;x2=3;
rx = x1:.1:x2;
f = @(x) a1 +b1*(x-x1) + c1*(x-x1).^2;
plot(rx,f(rx),'b','LineWidth',2)

sc2 = scatter(x(3:4),y(3:4),'o','MarkerFaceColor','r')

a1=3;b1=-8;c1=9;
x1=3;x2=4;
rx = x1:.1:x2;
f = @(x) a1 +b1*(x-x1) + c1*(x-x1).^2;
plot(rx,f(rx),'b','LineWidth',2)
