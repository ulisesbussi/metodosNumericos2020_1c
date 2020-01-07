A=[1 3 4 5 1; 
    2 2 3 4 5; 
    3 3 3 2 2; 
    4 3 1 4 1; 
    1 4 5 6 1];
b=[1 1 1 1 1];
n=5;

AexLU = A;
L = zeros(n,n);
Ident = eye(n,n);
    
for k=1:n-1
   for i=k+1:n
        RES(i,k)=AexLU(i,k)/AexLU(k,k);
        for j=k:n
            AexLU(i,j)=AexLU(i,j)-RES(i,k)*AexLU(k,j);
        end
   end 
end

U=AexLU;

 for k=1:n-1
 for i=k+1:n
            L(i,k)=A(i,k)/A(k,k);
 end
 end
 

LR = L + Ident;
UR = U + Ident;
Ax  = L*U;
Ax2 = LR*U;
Ax3 = LR*UR;
Ax4 = L*UR;