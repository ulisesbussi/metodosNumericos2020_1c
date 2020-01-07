classdef f2c7
    %esta funcion es para el ejercicio de ecuaciones Diferenciales
    %Funcion 1 de la clase 7
    %by boris 2016
    %esta funcion es la representacion de un bioreactor perfectamente
    %AGITADO,
   
   
    properties
    end
    
    methods
        function ys=evaluameDif(obj,y)
            %datos del problema
            F=1;
            cin=1;
            V=10;
            k=0.3;
            %simplificacion intermedia
            A=(F/V)*cin;
            B=(k+(F/V));
            %solucion final
            ys=A-B*y;
        end
    end
    
end

