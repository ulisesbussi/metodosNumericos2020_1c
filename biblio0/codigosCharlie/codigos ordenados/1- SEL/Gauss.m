
b=[1:n];

Aexg= [A b'];

for k=1:n-1
   for i=k+1:n
        RES(i,k)=Aexg(i,k)/Aexg(k,k);
        for j=k:n+1
            Aexg(i,j)=Aexg(i,j)-RES(i,k)*Aexg(k,j);
        end
   end 
end

