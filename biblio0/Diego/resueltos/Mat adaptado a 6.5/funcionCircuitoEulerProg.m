function [ w ] = funcionCircuitoEulerProg( wi,vi,t )
    %Calcula el W i+1 para la ecuacion del potencial en el capacitor por
    %medio de Euler Progresivo
    
    L = 0.1;
    C = 10e-3;
    R1 = 10;
    R2 = 10;
    e = @(t) 5; 
    %e = @(t) 5*exp(-0.1*t);
    %e = @(t) 5*exp(0.1*t);
    %e = @(t) 5*sin(t);
    
    A = -(1./(L.*C)).*((L./R2) + C.*R1);
    B = -(1./(L.*C)).*(1 + R1./R2);
    D = 1./(L.*C);
    
    w =  A*wi + B*vi + D*e(t);
end

