%scriptPrueba

h=1e-4;
X=(0:h:5);
Y=funcionBiorreactorRK2_2(X);
plot(X,Y)