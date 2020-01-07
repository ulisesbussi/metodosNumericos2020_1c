t=(1:0.1:10);

h=0.1;

n=length(t);

depe(3,30);

CEP(1,1)=3;

CEP(1,2)=30;


for i=1:n-1
    
    [outc , outp]  = depe(CEP(i,1),CEP(1,2));
    

    CEP(i+1,1)  = CEP(i,1) + h*outc;
    CEP(i+1,2)  = CEP(i,2) + h*outp;
   
        

end