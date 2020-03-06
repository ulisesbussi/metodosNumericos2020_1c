
a=[];
b=[];
c=[];

tic
for i=1:1000
    a(end+1)= fac(i);
end
aa=toc;

tic
for i=1:1000
    b(end+1)= fac2(i);
end
bb=toc;

tic
for i=1:1000
    c(end+1)= factorial(i);
end
cc=toc;


function k = fac(n)
acum=1;
    for i=1:n
       acum = acum*i;
    end
    k=acum;
end


function k = fac2(n)
    if n<=1
        k=1;
    else
        k= n*fac2(n-1);
    end
end
