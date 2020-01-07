classdef f1c6
    %esta funcion es para el ejercicio de ecuaciones Diferenciales
    %Funcion 1 de la clase 7
    %by boris 2016
    %esta funcion es la representacion de un bioreactor perfectamente
    %AGITADO, solucion analitica
    properties
   
    end
    
    methods 
        function y=evaluateDif(obj,x,c0)
            %datos del problema
            F=1;
            cin=1;
            V=10;
            k=0.3;
            %simplificacion intermedia
            A=(F/V)*cin;
            B=(k+(F/V));
            %solucion final
            c1=(c0-(A/B))/(exp(-B*x));
            y=(A/B)+c1*exp(-B*x);
        end
        
        function y=sol(obj,x,F,cin,V,k,c1)
            A=(F/V)*cin;
            B=(k+(F/V));
            y=(A/B)+c1*exp(-B*x);
        end
    
        function y=sol3(obj,A,B,c1,X)
        y=(A/B)+c1*exp(-B*X);
        end
    end
end