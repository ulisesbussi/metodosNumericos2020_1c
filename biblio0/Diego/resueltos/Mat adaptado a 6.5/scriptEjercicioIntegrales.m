clc
clear all

f1 = @(x) x .* exp(-x) .* cos(2*x);
f2 = @(x) x./x;

n = [1 3 6 10 33 66 100 133 166 200];

for j=1:length(n)

    for i=1:7*n(j)
        X1(i) = i*2*pi/(7*n(j)-1);
        Y1(i) = f1(X1(i));
    end

    A1(j) = integralPuntoMedio(X1,Y1);
    A2(j) = integralTrapecio(X1,Y1);
    A3(j) = integralSimpson(X1,Y1);
    A4(j) = integralTresOctavos(X1,Y1);
    A5(j) = integral(f1, 0, 2*pi);

    fprintf('ya corrio n = %d \n', n(j));
end

A1
A2
A3
A4
A5