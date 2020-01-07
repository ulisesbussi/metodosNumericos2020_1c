function [ w ] = funcionCircuitoEulerReg( h,wi,vi )
    %Calcula el W i+1 para la ecuacion del potencial en el capacitor por
    %medio de Euler Regresivo
    
    L = 0.1;
    C = 10e-3;
    R1 = 10;
    R2 = 10;
    e = 5;
    
    A = -(1./(L.*C)).*((L./R2) + C.*R1);
    B = - (1/(L.*C)).*(1 + R1./R2);
    D = e./(L.*C);
    
    w = (wi + h*B*vi + h*D) / (1 - h*A - (h^2)*B);
end

