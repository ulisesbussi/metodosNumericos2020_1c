%X = [0 1 2 3 4 5 6 7 8 9 10];
%Y = [0 3 6 9 12 15 18 21 24 27 30];
clc
clear
num=100;
VEC = [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5];

X=linspace(-10,10,num);
Y=power(X,2);

for i=1:length(VEC)

y0(i) = lagrange_interp(X, Y, VEC(i));

ys(i) = spline(X,Y,VEC(i));
end
hold on
plot(X,Y,'g')
plot(VEC,y0,'b--o')
plot(VEC,ys,'ro')