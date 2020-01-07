function [dC] = dCdT(p,c)
%Funcion que define el cambio de c en el tiempo
%     k1=0.4;
%     k2=0.02;
    k3=0.002;
    k4=0.03;

    dC=k3*c*p-k4*c;
end

