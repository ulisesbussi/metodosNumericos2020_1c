function [dP] = dPdT(p,c)
%Funcion que define el cambio de p en el tiempo
    k1=0.4;
    k2=0.02;
%     k3=0.002;
%     k4=0.03;

    dP=k1*p-k2*c*p;
end

