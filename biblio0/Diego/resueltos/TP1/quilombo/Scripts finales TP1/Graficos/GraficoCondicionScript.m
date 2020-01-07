nrosCond=1.0e+03*[ 0.0092 0.0200 0.0469 0.1013 0.2326 0.4930 1.1155 1.7811];
n=[10 30 100 300 1000 3000 10000 20000];
loglog(n, nrosCond);
title('K2 vs Tamaño de la Matriz');
xlabel('n');
ylabel('K2');