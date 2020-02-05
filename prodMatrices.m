%Calculo del producto de dos funciones

%%
a = randn(5);
b = randn(5);

%%

ords = [5 ,10,20,50,75,100,150,200,250,300,400,500];
lord = length(ords);
times = zeros(lord,1);
timesMatlab = zeros(lord,1);
niter = 1;
for iter=1:lord
    a = randn(ords(iter));
    b = randn(ords(iter));
    tic
    for i=1:niter
        c = producto(a,b);
    end
    t = toc;
    for i=1:niter
        c1 = a*b;
    end
    tMat = toc -t;
    times(iter) = t/niter;
    timesMatlab(iter) = tMat/niter;
end




%%
figure()
hold on
ax = gca();
plot(ords,times,'b')
plot(ords,timesMatlab,'r')
legend('Tiempos Producto programado','Tiempos Producto MatLab')
xlabel('Orden de la matriz')
ylabel('Tiempo en segundos')



%%

function c = producto(a,b)
    [l,l1] = size(a);
    [l2,l3] = size(b);
    
    if l==l1 && l1==l2 && l2==l3
        c = zeros(size(a));
        for i=1:l
            for j=1:l
                for k=1:l
                    c(i,j) = c(i,j) +a(i,k) +b(k,j);
                end
            end
        end
        
    else
       disp('error las matrices deben ser cuadradas y del mismo orden')
    end
end