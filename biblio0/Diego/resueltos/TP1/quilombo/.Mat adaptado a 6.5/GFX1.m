X=[10 30 100 300 1000 3000 10000];
Y1=[0.0091 0.0118 0.0425 0.9047 36.0535 979.7783 1.0e+04 * 9.2381];
Y2=[0.0088 0.0106 0.0418 0.8968 35.7939 971.7350 1.0e+04 * 9.1953];
Y3=[0.0055 0.0059 0.0119 0.1275 5.7728 184.9242 1.0e+03 * 5.242];
Y4=[0.0071 0.0072 0.0076 0.0108 0.0575 0.4778 90.9256];
Y5=[0.0065 0.0070 0.0094 0.0329 2.2780 44.2363 1.0e+03 * 1.0242];
Y6=[0.0058 0.0056 0.0067 0.0217 0.2455 2.3139 57.1905];
Y7=[0.0001 0.0001 0.0003 0.0016 0.0496 0.7399 88.9729];
loglog(X,Y1,'bo--',X,Y2,'go--',X,Y3,'co--',X,Y4,'ro--',X,Y5,'mo--',X,Y6,'ko--',X,Y7,'yo--', 'LineWidth',1.5,'Marker','+')
title('Tiempo de Resolucion vs Tamaño de Matriz')
xlabel('n')
ylabel('t')
% gtext('AZUL: Factorizacion de Gauss')
% gtext('VERDE: Factorizacion LU')
% gtext('CELESTE: Factorizacion de Cholesky')
% gtext('ROJO: Factorizacion de Thomas')
% gtext('NEGRO: Metodo de Jacobi')
% gtext('AMARILLO: Metodo de Matlab')
% grid
