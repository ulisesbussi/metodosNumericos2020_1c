clear all
close all
clc

% x = (0:0.001:2*pi);
syms x
f(x) = x*x*x + 2*x + x -15;

x1 = (0:1:100);
y1 = f(x1);
plot(x1,y1)



n = [3 5 7 11 17 23 29 35 45 61 75 101];  % cantidad de puntos totales

for i=1:length(n)
    
x2 = linspace (0,100,n(i));
y2 = f(x2);

h = x2(3)-x2(1);

SumaR = 0;
    
    for j=1:(n(i)-1)/2
        
       SumaR = SumaR + y2(2*j);
       
    end
   
  
    ptomedio(i) = SumaR*h;
  
end

for i=1:length(n)
    
x2 = linspace (0,100,n(i));
y2 = f(x2);

h = x2(2)-x2(1);

SumaR = 0;
    
    for j=1:(n(i)-1)
        
       SumaR = SumaR + y2(j) + y2 (j+1);
       
    end
   
  
    ptomedio2(i) = SumaR*(h/2);
  
end


ptomedio = double(ptomedio);
ptomedio2 = double(ptomedio2);