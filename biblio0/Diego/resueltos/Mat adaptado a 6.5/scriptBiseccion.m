clc
clear all

h = 0.1;
y1 = 2.7792e-04;
freg = @(y) 4.*h.*y^2 + (1 - 4.*h) .* y - y1;


    %freg = @(y) 4.*0.1.*y^2 + (1 - 4.*0.1) .* y - 1.6706e-04;

y2 = algoritmoBiseccion(freg, 1e-4, 30, 1e-6, 10000);
y2