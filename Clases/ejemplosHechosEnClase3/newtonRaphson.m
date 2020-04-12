
%Punto Fijo
%f(x) =x^2-x-1

f  = @(x) x.^2 -x -1;%funcion

f1 = @(x) 2.*x -1;%derivada


x0 =2;


%M�todo de Newton-Raphson
r = x0; %r es mi candidato a raiz
i = 1;
maxIter = 100;
tolerancia = 1e-1;
funcEval = f( r(1) );



while( abs(funcEval) > tolerancia && i<maxIter)
    %r(i+1) = r(i) - f(r(i))/f1(r(i));
    candidatoARaizViejo = r(i);
    candidatoARaizNuevo = candidatoARaizViejo -...
                            f(candidatoARaizViejo)/f1(candidatoARaizViejo);
    r(i+1) = candidatoARaizNuevo;
    
    funcEval = f( candidatoARaizNuevo );
    
    i = i+1;
end
