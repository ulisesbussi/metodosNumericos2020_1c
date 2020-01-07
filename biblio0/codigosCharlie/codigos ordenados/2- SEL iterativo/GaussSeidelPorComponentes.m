function X=GaussSeidelPorComponentes(A,B,X,tol,Nmax)
r=B-A*X;
k=1;
[f,c]=size(A);
tol2=tol*norm(B);

while(k<=Nmax)&&(norm(r)>tol2)
    %X(1)=B(1)-A(1,2)*X(1);
    

    for i=1:c
        suma1=0;
        suma2=0;
        if i~=1
            suma1=A(i,i-1)*X(i);
        end
        
        if i~=c
            suma2=A(i,i+1)*X(i);
        end
        
        X(i)=B(i)-suma1-suma2;
        X(i)=X(i)/A(i,i);
         
    end
   
   r=B-A*X;
   k=k+1;
   if(k==Nmax)
      error('Nmax de iteraciones alcanzado') 
   end
end
end