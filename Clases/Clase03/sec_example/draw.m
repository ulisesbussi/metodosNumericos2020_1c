%Dibujo del metodo de la secante


f = @(x) x.^2 -3;

x=0:.1:5;

figure()
hold on
plot([0,0],[-3,22],'k')
plot([0 5],[0 0],'k')
plot(x,f(x),'b','LineWidth',2.5)

p0 =4;
p1 = 5;
scatter([p0,p1],[f(p0),f(p1)],'MarkerFaceColor','m','MarkerEdgeColor','m','MarkerFaceAlpha',.5)
scatter(2.55,0,'MarkerFaceColor','m','MarkerEdgeColor','m')
rec = @(x) 9*x-23;
plot([2.55,5],[rec(2.55) rec(5)],'--k','LineWidth',2)
plot([4 4],[0 f(4)],'--k')
plot([5 5],[0 f(5)],'--k')
c_annot = annotation('textbox','interpreter','latex','String','$x_1$','FitBoxToText','on');
c_annot.FontSize=15;

c_annot = annotation('textbox','interpreter','latex','String','$x_0$','FitBoxToText','on');
c_annot.FontSize=15;


c_annot = annotation('textbox','interpreter','latex','String','$x_2$','FitBoxToText','on');
c_annot.FontSize=15;

%%
