clear all
close all
clc

% x = (0:0.001:2*pi);
x = sym('x');
f(x) = x*exp(-x)*cos(2*x);

x1 = (0:0.001:2*pi);
y1 = f(x1);

IntExac = -(10*pi-3+3*exp(2*pi))/(25*exp(2*pi));

figure(1)
plot(x1,y1)
grid on

% Integral por punto medio

n = [3 5 7 11 17 23 29 35 45 61 75 101];  % cantidad de puntos totales

for i=1:length(n)
    
    x2 = linspace(0,2*pi,n(i));
    y2 = f(x2);
    
%     figure(1)
%     plot(x1,y1,x2,y2,'or')
%     grid on
%     pause()
    
    h(i) = x2(3)-x2(1);
    
    fprintf('Integral por punto medio, h = %g\n',h(i))
    
    SumaR = 0;
    
    for j=1:(n(i)-1)/2
        
       SumaR = SumaR + y2((j+j+1)/2);
       
    end
    
    IntPtoMedio(i) = SumaR*h(i);
    
end

ErrPtoMedio = abs(IntExac - IntPtoMedio);

figure(2)
loglog(h,ErrPtoMedio)
grid on
         
