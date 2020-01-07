%Solving 1st order derivative numerically using for loop method
tic
clc
clear all
num=100;%change the number of grid points
x=linspace(-10,10,num);
df=derivative_1st( x,num );%taking the calculated value of the 1st order derivative
[ dfal,dfbl ] = derivative_h2( x, num);

%plot(x,df,'k-*');
%plot(x,dfal,'k-*');
%plot(x,dfbl,'k-*');
hold on
grid on
sum=0;
%analytical solution
syms x1 f1 z1
f1= x1*x1*x1;
z1=diff(f1);
anaval=subs(z1,x);
plot(x,anaval,'r--o');
xlabel('x');
ylabel('df/dx');
title('First derivative of function');
legend('Numerical','Analytical');

%error calculation
Err=(anaval'-df);
for ii=1:length(Err)
    sum=sum+Err(ii)^2;
end

Err1=sqrt(sum/ii)
deltax=x(2)

toc