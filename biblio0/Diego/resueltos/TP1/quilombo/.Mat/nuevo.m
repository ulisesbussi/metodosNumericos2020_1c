function [ X ] = nuevo( A b )
    %UNTITLED Summary of this function goes here
    [L,U] = algoritmoLU(A);
    y = algoritmoDescenso(L,b);
    x = algoritmoRemonte(U,y);
end

