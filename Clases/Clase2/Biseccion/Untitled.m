
f = @(x) -2*(x-2).^2 + 3;
f1 = @(x) -2*x.^2+8*x-5;

a = 2;
b = 5
x= a:.1:b;


figure(1)
hold on
grid on


plot(x,f(x),'k','lineWidth',3)
plot([a,b],[0,0],'k','lineWidth',.5)
plot([a,b],[f(a),f(b)],'--b','lineWidth',2)

c = a +f(a) *(b-a)/(f(a)-f(b));
plot([a,a,c,a],[0,f(a),0,0],'r')


plot([b,b,c,b],[0,f(b),0,0],'m')


plot([a,b],[f(a),f(b)],'--b','lineWidth',2)

c_annot = annotation('textbox','interpreter','latex','String','$\bf \hat c$','FitBoxToText','on');
a_annot = annotation('textbox','interpreter','latex','String','$\bf a$','FitBoxToText','on');
b_annot = annotation('textbox','interpreter','latex','String','$\bf b$','FitBoxToText','on');
c_annot.FontSize=15;
a_annot.FontSize=15;
b_annot.FontSize=15;


%%


figure(1)
hold on
grid on

plot(x,f(x),'k','lineWidth',3)
plot([a,b],[0,0],'k','lineWidth',.5)
plot([a,b],[f(a),f(b)],'--b','lineWidth',2)

c = a +f(a) *(b-a)/(f(a)-f(b));
plot(c,f(c),'or','lineWidth',2)
plot([c,c],[0,f(c)],'--r')