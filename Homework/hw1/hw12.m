x=[3 -2 6 8 -1];
h=[2 5 0 -5 2 -3 1];

y=conv(x,h);

%(a)
x1=fft(x,64);
h1=fft(h,64);
y1=fft(y,64);
stem(abs(y1));
title('Magnitude of y[n]');
xlabel('Sample');
ylabel('Magnitude');

%(b)
figure();
subplot(2,1,1);stem(abs(x1));
title('Magnitude of x[n]');
xlabel('Sample');ylabel('Magnitude');
subplot(2,1,2);stem(abs(h1));
title('Magnitude of h[n]');
xlabel('Sample');ylabel('Magnitude');

%(c)
figure();
subplot(2,1,1);stem((abs(x1.*h1)));
title('Magnitude of the product of x[n] and h[n]');
xlabel('Sample');ylabel('Magnitude');
subplot(2,1,2);stem(abs(fft(y,64)));
title('Magnitude of y[n]');
xlabel('Sample');ylabel('Magnitude');