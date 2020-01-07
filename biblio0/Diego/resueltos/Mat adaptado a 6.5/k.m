function [ k ] = k( x )
%Retorna el valor k correspondiente al x para el ejercicio de la clase 10
    if x < 5
        k = 50;
    else
        if x < 8.5
            k = 30;
        else
            k = 70;
        end
    end
end

