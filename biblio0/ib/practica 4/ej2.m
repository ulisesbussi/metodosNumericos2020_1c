

n=5


S1 = sparse([1:n], [1:n], 2*ones(1,n), n, n, 0)
S2 = sparse([1:n-1], [2:n], -1*ones(1,n-1), n, n, 0)
S3 = sparse([2:n], [1:n-1], -1*ones(1,n-1), n, n, 0)
A1 = full(S1 + S2 + S3) # Si se quiere la matriz en formato LLENO
A2= S1 + S2 + S3 # Si se quiere la matriz en formato RALO
b = ones(1,n)/(n + 1)**2; # Para generar el vector segundo miembro