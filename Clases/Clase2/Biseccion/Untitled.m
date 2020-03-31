
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
plot([a,b],[f(a),f(b)],'--b','lineWidth',1.5)

c = 


%%


plot(c1,f(c1),'ob','lineWidth',3)
plot(c,f(c),'ob','lineWidth',3)


c2 = (c1+c)/2;

plot(c2,f(c2),'or','lineWidth',2)
plot([c2,c2],[f(b),f(c2)],'--r','lineWidth',.5)

b1 = c;