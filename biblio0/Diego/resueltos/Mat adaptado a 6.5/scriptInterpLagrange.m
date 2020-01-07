X1 = [4, 8, 12, 16, 20];
Y1 = [1000.7794, 1000.6427, 1000.2805, 999.7165, 998.9700];

X2 = [6, 10, 14, 18];

[Y2]=interpLagrange(X1, Y1, X2);

P3=polyfit(X1,Y1,3);
Y3=polyval(P3,X2);

P5=polyfit(X1,Y1,5);
Y5=polyval(P5,X2);

Ys = spline(X1,Y1,X2);

Y2
Y3
Y5
Ys