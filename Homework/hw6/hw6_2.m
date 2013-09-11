h1=[1 2 3 4 4 3 2 1];
h2=[4 3 2 1 1 2 3 4];

h1_fft=fft(h1,8);
h2_fft=fft(h2,8);

figure();
stem(abs(h1_fft));
title('Magnitude of h1');
xlabel('Sample');
ylabel('Magnitude');

figure();
stem(abs(h2_fft));
title('Magnitude of h2');
xlabel('Sample');
ylabel('Magnitude');
