function [ p,c ] = Euler( x,y,h,tf )
%Resolucion de la EDO de cazador y presa por metodo de Euler
    p(1)=x;
    c(1)=y;
    t=(0:h:tf);
    n=length(t);
    
    for i=1:n-1
        outP=dPdT(p(i),c(i));
        outC=dCdT(p(i),c(i));
        p(i+1)=p(i)+h*outP;
        c(i+1)=c(i)+h*outC;
    end

end

