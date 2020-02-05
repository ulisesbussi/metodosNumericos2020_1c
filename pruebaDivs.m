




n=100;

tic
t0 = toc;
for i=1:n
    a=findDivs(5313120);
end
t1 = toc;
for i=1:n
    b=findDivs2(5313120);
end
t2 = toc;
for i=1:n
    c=findDivs3(5313120);
end
t3 = toc;


todos = (t3-t2)/n;
mitad = (t2-t1)/n;
optim = (t1-t0)/n;

a= sort(a);
b= sort(b);
c= sort(c);


%%
numeros = [6,9 , 53, 126,534,5313120];
l = length(numeros);
todo = zeros(l,1);
mit  = zeros(l,1);
opt  = zeros(l,1);

for i= 1:l
    tic
    t0 = toc;
    for j=1:10
        a  = findDivs3(numeros(i));
    end
    t1 = toc;
    for j=1:10
    b  = findDivs2(numeros(i));
    end
    t2 = toc;
    for j=1:10
    c  = findDivs(numeros(i));
    end
    t3 = toc;
    todo(i) = (t1-t0)/10;
    mit(i)  = (t2-t1)/10;
    opt(i)  = (t3-t2)/10;
end



%%

figure()
hold on
plot(numeros,todo)
plot(numeros,mit)
plot(numeros,opt)









%%
function divisores =findDivs(num)
    k = floor(sqrt(num));
    divisores = [1,num];
    for i=2:k 
        resto = mod(num,i);
        if resto == 0
            divisores(end+1) = i;
            divisores(end+1) = num/i;
        end

    end
    %divisores = sort(divisores)

end

function divisores =findDivs2(num)
    k = floor(num/2);
    divisores = [1,num];
    for i=2:k 
        resto = mod(num,i);
        if resto == 0
            divisores(end+1) = i;
            %divisores(end+1) = num/i;
        end
    end
    %divisores = sort(divisores)

end


function divisores =findDivs3(num)
    divisores = [1,num];
    for i=2:num-1
        resto = mod(num,i);
        if resto == 0
            divisores(end+1) = i;
        end
    end
    %divisores = sort(divisores)

end


