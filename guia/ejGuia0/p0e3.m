%%fibonacci


q = fibo2(30);



function k=fibo(n)

    x=[1,1];
    if n<1
        disp('error')
        k=[];
    elseif n==1
        k=x(1);
    else
        for i=1:n-2
            x(end+1) = x(end)+x(end-1);
        end
        k=x;
    end
end


function k=fibo2(n,estado)
    if nargin<=1
        estado = [1,1];
    end
    if n<1
        disp('error')
        k=[];
        return 
    elseif n==1
        k=1;
        return 
    elseif length(estado)<n
        estado(end+1) = estado(end) + estado(end-1);
        estado = fibo2(n,estado);
    end
    k = estado;
end