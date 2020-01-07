function [ x ] = algoritmoBiseccion( funcionDeX, a, b, Tol, NMax )
%Aproxima la raíz separada presente en el intervalo (a,b) de la función de x por el método de la
%bisección

    k = 1;

    if not(funcionDeX(a)* funcionDeX(b) < 0)
        error('No hay cambio de signo entre los extremos del intervalo (a,b)');
    end

    I = b - a;

    while (abs(I) > Tol) && (k <= NMax)

        x = (a + b)/2;

        if funcionDeX(a)* funcionDeX(x) < 0
            b = x;
        elseif funcionDeX(b)* funcionDeX(x) < 0
            a = x;
        else
            a = x;
            b = x;                    
        end

        I = b - a;
        k = k + 1;

    end

    if k > NMax
        error('Número de iteraciones máximo alcanzado');
    else
        fprintf('Nro de iteraciones: %d \n', k);
    end
end

