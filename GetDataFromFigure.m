

%abro el .fig
fig = open('untitled.fig');


%obtengo los axes
axes = fig.Children;

%obtengo los plots
dataObjs = axes.Children;

numeroDePlots = length(dataObjs);


%si quiero por ejemplo acceder a las coordenadas x e y del primer plot
x = dataObjs(1).XData;
y = dataObjs(1).YData; 
%ojo acá no probé que pasa si en el gráfico hay un solo plot, no se si se
%puede acceder con el índice.

figure()
plot(x,y,'r--')
%.......%%