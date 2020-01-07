function Y=AdamMoutonPredictor(f,h,Yref)
%esta funcion resuelve una ecuacion diferencial utilizando el algorito de
%Adams Mouton con el metodo predictor corrector
%una funcion diferencial,el paso del vector de absisas,Y de referencia que se utiliza como predictor
Y=NaN(size(Yref));
Y(1)=Yref(1);
Y(2)=Yref(2);
Y(3)=Yref(3);
for i=3:length(Yref)-1
    Y(i+1)=Y(i)+(h/24)*(9*f.evaluameDif(Yref(i+1))+19*f.evaluameDif(Y(i))-5*f.evaluameDif(Y(i-1))+f.evaluameDif(Y(i-2)));
end