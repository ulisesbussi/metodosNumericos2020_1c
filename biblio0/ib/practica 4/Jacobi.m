Jacobi

x=x0;
k=0;
do
	xold=x
	k=k+1
	for i=1:n
		x[i]=b[i]
		for j=1:n
			if(j!=i)
				x[i]=x[i]-a[i][j]*xold
			end
		end
		x[i]=x[i]/a[i][i]
	end
	e=norm(x-xold)
while(e>"algo" && k<"maximo de iteraciones)