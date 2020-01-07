A =[1 1 2 3 ; 2 2 5 6; 3 3 3 1; 4 4 4 4];

n = length (A);

At(1,1)=A(1,1);
Res =0;
for k=2:n
    for r=1:k-1
        Res=Res + A(k,k);
    end
    At(k,k)=A(k,k)-Res;
end