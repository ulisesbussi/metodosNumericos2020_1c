clc
clear all

f1 = @(x) x .* exp(-x) .* cos(2*x);
f2 = @(x) x./x;

n = [1 3 6 10 33 66 100 133 166 200 300 400 500 1000 2000 5000 10000 50000];

for j=1:length(n)

    for i=1:7*n(j)
        X1(i) = i*2*pi/(7*n(j)-1);
        Y1(i) = f1(X1(i));
    end

    A5(j) = integral(f1, 0, 2*pi);
    
    A(j, 1) = abs(integralPuntoMedio(X1,Y1) - A5(j));
    A(j, 2) = abs(integralTrapecio(X1,Y1) - A5(j));
    A(j, 3) = abs(integralSimpson(X1,Y1) - A5(j));
    A(j, 4) = abs(integralTresOctavos(X1,Y1) - A5(j));
    

    fprintf('ya corrio n = %d \n', n(j));
end
    
loglog(n, A)