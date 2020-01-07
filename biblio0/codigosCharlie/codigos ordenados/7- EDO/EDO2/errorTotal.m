function err=errorTotal(X,Y)
%esta funcion esta disenhada para conseguir el error absuluto entre 2
%vectores punto a punto
err=0;
for i=1:length(X)
    err=err+abs(X(i)-Y(i));
end
end