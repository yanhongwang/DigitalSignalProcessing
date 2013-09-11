x_coef=[0 3 -1];
y_coef=[1 0 -0.25];

%(1)
zplane(x_coef, y_coef);

%(2)
figure();
impz(x_coef, y_coef, 20);

%(3) response of magnitude and phase of inverse system
figure();
freqz(y_coef, x_coef);

%response of magnitude and phase of system
figure();
freqz(x_coef, y_coef);