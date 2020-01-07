clc
clear

num=100;
x=linspace(-10,10,num);
delx=x(2)-x(1);
f=power(x,3);
df=zeros(num,1);

for i=2:1:num-1
    df(i)=(f(i+1)-f(i-1))/(2*delx);
end
for i=1:2
    df(i)=(f(i+1)-f(i))/delx;
end
for i=num-1:num
   df(i)=(f(i)-f(i-1))/delx;
end

for i=1:num-2
dfal(i)=( -3/2*f(i)+4/2*f(i+1)-1/2*f(i+2))/delx;
end
dfal(num-1)=1
dfal(num)=1;

for i=3:num
dfbl(i)=( 1/2*f(i-2)-4/2*f(i-1)+3/2*f(i))/delx;
end
dfbl(1)=1
dfbl(2)=1;

syms x1 f1 z1
f1= x1*x1*x1;
z1=diff(f1);
anaval=subs(z1,x);
hold on
plot(x,anaval,'ro');plot(x,df);
xlabel('x');
ylabel('df/dx');
title('Primera derivada');
legend('Numerica','Analitica');
hold off
figure
hold on
plot(x,dfbl);
plot(x,dfal,'g');
plot(x,anaval,'ro')
xlabel('x');
ylabel('df/dx');
title('Primera derivada');
legend('Numerica','Analitica');
hold off

