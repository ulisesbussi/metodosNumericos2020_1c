set term postscript
set size 0.9,0.9
set logscale y
set out 'KrbM.ps'
plot [][1e-10:1] 'Datos4_K-S.dat' t ' Simulated ' w p 2, 'GrafKrbM.out' t 'BurdineMejorado model' w l
set xlabel ' Effective saturation '
set ylabel ' Relative hydraulic conductivity '
set key bottom
unset logscale y


