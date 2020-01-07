function Yana=solAna(ana,X,c0)
%este es la fuincion de la solucion analitica al problema del bioreactor

%condiciones delProblema
F=1;
cin=1;
V=10;
k=0.3;
%simplificacion intermedia
A=(F/V)*cin;
B=(k+(F/V));
%solucion final
c1=(c0-(A/B))/(exp(-B*0));
n=length(X);
Yana=NaN(1,n);

for i=1:n
    Yana(i)=ana.sol(X(i),F,cin,V,k,c1);
end    
end