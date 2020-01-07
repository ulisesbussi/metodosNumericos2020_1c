function [ K2 ] = numeroDeCondicionDe( A, tol, Nmax )
%Retorna el numero de condicion de la matriz A definida positiva, para la
%tolerancia tol y el numero de iteraciones maximo Nmax.
    mayorAv = potenciaIteradaTridiag(A, tol, Nmax);
    menorAv = potenciaInversaTridiag(A, tol, Nmax);
    
    K2 = mayorAv/menorAv;
end