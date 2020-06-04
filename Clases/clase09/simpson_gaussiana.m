%Primero voy a analizar la función.
f = @(x) exp(- x.^2)/sqrt(pi);

% x =-500:10:500;
% plot(x,f(x))
% 
% x =-50:1:50;
% plot(x,f(x))
% 
% x =-10:0.1:5;
% plot(x,f(x))

a = -5;
b =  1;

n=100;
dx = (b-a)/n;

x = a:dx:b ;

integral =0;
for j=1:n
    p = dx * ( f(x(j)) +  4*f(x(j)+dx/2 )  + f(x(j+1)) ) / 6;
    integral =integral + p;
end