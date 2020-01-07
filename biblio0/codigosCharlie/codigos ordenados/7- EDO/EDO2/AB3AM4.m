function Y=AB3AM4(X,h,f,ci)
[f,c]=size(X);
Y=MetRk4paraAdam(f,X,ci,h);


for i=3:c
    Y(i+1)=Y(i)+(h/12)*(23*f.evaluameDif(Y(i))-16*f.evaluameDif(Y(i-1))+5*f.evaluameDif(Y(i-2)));
    aux=(9*(f.evaluameDif(Y(i+1)))+19*(f.evaluameDif(Y(i)))-5*f.evaluameDif(Y(i-1))+f.evaluameDif(Y(i-2)));
    Y(i+1)=Y(i)+(h/12)*(aux);
end