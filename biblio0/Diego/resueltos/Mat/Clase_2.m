clear all                   % Símbolo de nota. Conviene clear all al inicio de cada editor para que quede cheto 
clc                         % Este comando borra todo lo que aparece en el command window

A = [1 1 3 ; 2 2 2 ; 3 6 4];
B = [5 ; 6 ; 13];
Epsilon = 0.33;
A(1,2)= A(1,2) - Epsilon;
B(1)= B(1) - Epsilon;

% resaltando una linea y apretando F9, se ejecuta en pantalla

% tarea: programar el algoritmo de descenso, e ir viendo cómo resolver lo
% de la primera clase

L=[2 0 0 ; 3 5 0 ; 4 6 7];

b=[10, 20, 30];




J = algoritmoDescenso(L,b)