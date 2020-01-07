function [ ] = graficoLinealSimple(X,Y,xLabel,yLabel,leGend)
	%Genera un gráfico decente
    

    % Create figure
    figure1 = figure;

    % Create axes
    axes1 = axes('Parent',figure1,'FontSize',12);
    box(axes1,'on');
    grid(axes1,'on');
    hold(axes1,'all');

    % Create plot
    plot(X,Y,'Parent',axes1,'DisplayName',leGend);

    % Create xlabel
    xlabel({xLabel},'FontSize',13);

    % Create ylabel
    ylabel({yLabel},'FontSize',13);

    % Create legend
    legend1 = legend(axes1,'show');
    set(legend1,'FontSize',13);
    
end

