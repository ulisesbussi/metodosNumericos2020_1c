%% Ejercicio 1a
start = 0;
stop = 100;
paso = 0.1;
nPoints = (stop-start )/ paso + 1;
x1 = linspace(start,stop,nPoints);
x = 0:.1:100;

%% 1b
%definop las funciones f1...f5
f1 = @(x) x.^2+3*x-7;
f2 = @(x) exp(x) -3* x.^2 .* log(x);
f3 = @(x) sqrt( x.^2+x-cos(x) ).* exp(-x.^2);
f4 = @(x) sqrt( x.^2-3);
f5 = @(x) cos(x);

%las pongo en una celda y creo otra para contener los valores de y
functions = {f1,f2,f3,f4,f5};
y={};

%cuando recorro con el for, obtengo la celda en particular, tengo que
%evaluarla para que pueda usar el contenido con el corchete en 1
for f=functions 
    y{end+1} = f{1}(x);
end

%%
figure()

hold on
xlabel('Coordenada x')
ylabel('Valor y')

labels = {};
for i=1:length(functions)
    subplot(3,2,i)
    lb = func2str(functions{i});
    labels{end+1} =strrep(lb(5:end),'.','');
    plot(x,y{i})
    legend(labels{i},'Location','best')
end





