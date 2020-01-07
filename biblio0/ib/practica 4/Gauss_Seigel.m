Gauss-Seidel
k=0,(x=x0,a,b):Datos
do
	for i=1:n
		x*=b[i]
		for j=1:n
			if(j!=i) x*=x*-a[i][j]x[j]
		end
		x* =x*/a[i][j]
		D[i]=x[i]-x*
		x[i]=x*
	end
	e=norm(D[i]), k=k+1
while(e>"tol" && k< "maximas iteraciones")