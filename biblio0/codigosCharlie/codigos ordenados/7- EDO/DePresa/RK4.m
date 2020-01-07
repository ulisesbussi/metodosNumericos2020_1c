function [p,c] = RK4(x,y,h,tf)
%Runge-Kutta de 4to orden para cazador presa.
    p(1)=x;
    c(1)=y;
    t=(0:h:tf);
    n=length(t);


%     for i=1:n-1
%         k1=dPdT(p(i),c(i));
%         k2=dPdT(p(i)+h/2*k1,c(i)+h/2*k1);
%         k3=dPdT(p(i)+h/2*k2,c(i)+h/2*k2);
%         k4=dPdT(p(i)+h*k3,c(i)+h*k3);
%         if (isnan(k1) || isnan(k2) || isnan(k3) || isnan(k4))
%             error('Algun k es nulo')
%         else
%             p(i+1)=p(i)+h*(1/6*k1+1/3*k2+1/3*k3+1/6*k4);
%         end
%         k1=dCdT(p(i),c(i));
%         k2=dCdT(p(i)+h/2*k1,c(i)+h/2*k1);
%         k3=dCdT(p(i)+h/2*k2,c(i)+h/2*k2);
%         k4=dCdT(p(i)+h*k3,c(i)+h*k3);
%         if (isnan(k1) || isnan(k2) || isnan(k3) || isnan(k4))
%             error('Algun k es nulo')
%         else
%             c(i+1)=c(i)+h*(1/6*k1+1/3*k2+1/3*k3+1/6*k4);
%         end
%     end

    for i=1:n-1
        k1=dPdT(p(i),c(i));
        k2=dPdT(p(i)+h/2*k1,c(i));
        k3=dPdT(p(i)+h/2*k2,c(i));
        k4=dPdT(p(i)+h*k3,c(i));
        if (isnan(k1) || isnan(k2) || isnan(k3) || isnan(k4))
            error('Algun k es nulo')
        else
            p(i+1)=p(i)+h*(1/6*k1+1/3*k2+1/3*k3+1/6*k4);
        end
        k1=dCdT(p(i),c(i));
        k2=dCdT(p(i),c(i)+h/2*k1);
        k3=dCdT(p(i),c(i)+h/2*k2);
        k4=dCdT(p(i),c(i)+h*k3);
        if (isnan(k1) || isnan(k2) || isnan(k3) || isnan(k4))
            error('Algun k es nulo')
        else
            c(i+1)=c(i)+h*(1/6*k1+1/3*k2+1/3*k3+1/6*k4);
        end
    end

end