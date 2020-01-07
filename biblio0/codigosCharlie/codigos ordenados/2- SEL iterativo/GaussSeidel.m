function X=GaussSeidel(A,B,X,tol,Nmax)
k=1;
[f,c]=size(A);
r=B-A*X;
tol2=tol*norm(B);
M=tril(A,0);

while(k<=Nmax)&&(norm(r)>tol2)
   Z=algoDeDecenso(M,r);
   Z=transpose(Z);
   X=X+Z;
   r=B-A*X;
   k=k+1;
   if(k==Nmax)
      error('Nmax de iteraciones alcanzado') 
   end
end

end