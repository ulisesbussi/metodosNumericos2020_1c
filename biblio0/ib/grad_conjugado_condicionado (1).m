#gradientes conjugados con escaleo diagonal
#DEFINICIÓN DEL SISTEMA Y LA MATRIZ

function [void] = grad_conjugado_condicionado (void)

	rand("seed",1.0);
	max_dimension = 5000; #esta es la dimensión de la mayor matriz que voy a evaluar
	n=200; 
	k=0;
	t_max = 600;
	t= 0;
	t_o=time();

	while (n <= max_dimension && t < t_max)
	t = time()-t_o; #para que el programa no corra más de 10'
	k++;   #guardo el número de iteración

	#DEFINICIÓN DE LA MATRIZ Y LA SOLUCIÓN 

	v=5/(n-1)*[0:n-1];
	D = (10.**v);
	A = eye(n) + 0.01 *rand(n,n);     # tomo como matriz una identidad con una pequeña perturbación
	[Q R] = qr(A); 
	A= Q'*diag(D)*Q;
	b = ones(n,1)/(n+1)**2;		    #genero el vector segundo miembro

	#SOLUCIÓN DEL PROBLEMA, CON Y SIN CONDICIONAMIENTO
	[x_NC , t_NC , iteraciones_NC , error_NC, n_condicion1] = no_condicionado(A,b);
	[x_C , t_C , iteraciones_C , error_C , n_condicion2] = condicionado(A,b);

	mejora_condicion = ((n_condicion1 - n_condicion2)/(n_condicion1)*100);

	#ALMACENAMIENTO DE LOS DATOS OBTENIDOS
	datos(k,1)=n;    
	datos(k,2)=t_NC;
	datos(k,3)=iteraciones_NC;
	datos(k,4)=error_NC;
	datos(k,5)=t_C;
	datos(k,6)=iteraciones_C;
	datos(k,7)=error_C;
	datos(k,8)= mejora_condicion;
	n+=200; 				#incremento la dimensión de la matriz en 100
	save datos_gradiente_condicionado_corregido.dat datos;  #genero un archivo con los datos obtenidos

	endwhile
endfunction

function [x_k , t, k, error, n_condicion]= no_condicionado(A,b)
		k=0;
        t=time();
        n= size(A);
        tol = 1e-6;
        max_iter = n;
		if(norm(A-A',inf)>tol) 
			printf("¡la matriz no es del todo simétrica!");
		endif
        x_k=b;
        r_k = b - A*x_k;
        d_k = r_k;
		n_r = r_k'*r_k;
        while ( norm(r_k,inf) > tol && k <= max_iter ) 
                Adk = A*d_k;
				alfa = n_r / (d_k'*Adk);
				x_k = x_k + alfa*d_k;
					if(mod(k,50)==0)
						r_k = b-A*x_k;
					else
						r_k = r_k - alfa*Adk;
					endif
				n_r1 = n_r;
				n_r = r_k'*r_k;
				beta = n_r / n_r1;
				d_k = r_k + beta * d_k;
				k++;                
        endwhile
		error = sqrt(n_r);
		n_condicion = cond(A);
        t=time()-t;

endfunction

function [x_k , t, k, error, n_condicion] = condicionado(A,b)
	k=1;
	t=time();
	n= columns(A);
	tol = 1e-6;
	max_iter = n;
		
	#definición para encontrar el número de condición de E^-1* A * E^-T
	E = zeros(n);
	E = sparse (E);
	for(i=1:n)
		E(i,i)=1/(A(i,i))^.5;
	endfor
	E=E*A*E;
	n_condicion = cond(E);
	clear E;
	
	#definicion de la matriz de condicionamiento
	M=zeros(n);
	M= sparse(M);
	for(i=1:n)
		M(i,i)=1/A(i,i);
	endfor
	
	#algoritmo de gradientes conjugados condicionado
	x_k=b; 
	r_k = b-A*x_k;
	d_k = M*r_k;
	n_r = r_k'*d_k;
	error = norm(r_k,inf);
	
	while ( error > tol && k < max_iter ) 
		k++;
		Adk = A*d_k;
		alfa = (n_r) / (d_k'*Adk);
		x_k = x_k + alfa*d_k;
		n_r1 = n_r;
		r_k = r_k - alfa*Adk;
		R = M*r_k;
		n_r = r_k'*R;
		beta = n_r/n_r1;
		d_k = R + beta*d_k;
		error = norm(r_k,inf);
			
	endwhile
	t=time()-t;
	error = norm(b-A*x_k);
endfunction







