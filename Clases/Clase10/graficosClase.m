xr = 0:.1:4;

y  = @(x) 1*x.^2 +2*x +1;
y1 = @(x) 2*x +2;
rT = @(x) y1(1)*(x-1) + y(1);
rT2= @(x) y1(1.5)*(x-1.5) +6;
rTm = @(x) 4.5*(x-1) +y(1);
plot(xr,y(xr),'b','LineWidth',2)

hold on
a1= plot([0.5,1.5],[rT(0.5),rT(1.5)],'r','LineWidth',2)
a2= plot([1,2],[rT2(1),rT2(2)],'Color',[1,0.3,0],'LineWidth',2)
am = plot([0.5,1.5],[rTm(0.5),rTm(1.5)],'g','LineWidth',2)

a1.Color(4)=0.6;
a2.Color(4)=0.6;
plot(1,4,'ok','MarkerFaceColor','k')
plot(1.5,6,'ok','MarkerFaceColor','k')
plot(1.5,6.25,'ok','MarkerFaceColor','k')

xlim([0,2])