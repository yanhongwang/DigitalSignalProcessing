ts1=0.01;
fs1=1/ts1;
ts2=0.02;
fs2=1/ts2;
input1=0:ts1:3;
input2=0:ts2:3;
x1=sin(2*pi*input1);
x2=sin(2*pi*input2);
w1=upsample(x1,2);
w2=upsample(x2,2);
y1=downsample(w1,3);
y2=downsample(w2,3);

%(1)
y1_fft_512=fft(y1,512);
y2_fft_512=fft(y2,512);
n1=0:length(y1_fft_512)-1;
n2=0:length(y2_fft_512)-1;
f1=fs1*n1/length(y1_fft_512);
f2=fs2*n2/length(y2_fft_512); 
figure();
subplot(1,2,1); stem(f1, abs(y1_fft_512)); title('y1 of 512 points of fft, T=0.01s');
subplot(1,2,2); stem(f2, abs(y2_fft_512)); title('y2 of 512 points of fft, T=0.02s');

%(2-1)
figure();
subplot(3,2,1); stem(x1); title('x1, T=0.01s');
subplot(3,2,3); stem(w1); title('w1, x upsample 2, T=0.01s');
subplot(3,2,5); stem(y1); title('y1, w downsample 3, T=0.01s');
subplot(3,2,2); stem(x2); title('x2, T=0.02s');
subplot(3,2,4); stem(w2); title('w2, x upsample 2, T=0.02s');
subplot(3,2,6); stem(y2); title('y2, w downsample 3, T=0.02s');

%(2-2)
figure();
subplot(3,2,1); stem(abs(fft(x1))); title('x1 of fft, T=0.01s');
subplot(3,2,3); stem(abs(fft(w1))); title('w1 of fft, x upsample 2, T=0.01s');
subplot(3,2,5); stem(abs(fft(y1))); title('y1 of fft, w downsample 3, T=0.01s');
subplot(3,2,2); stem(abs(fft(x2))); title('x2 of fft, T=0.02s');
subplot(3,2,4); stem(abs(fft(w2))); title('w2 of fft, x upsample 2, T=0.02s');
subplot(3,2,6); stem(abs(fft(y2))); title('y2 of fft, w downsample 3, T=0.02s');

%(3)
y1_r=resample(x1,2,3);
y2_r=resample(x2,2,3);
figure();
subplot(2,2,1); stem(y1_r); title('y1 of resample, T=0.01s');
subplot(2,2,2); stem(abs(fft(y1_r))); title('y1 of resample of fft, T=0.01s');
subplot(2,2,3); stem(y2_r); title('y2 of resample, T=0.02s');
subplot(2,2,4); stem(abs(fft(y2_r))); title('y2 of resample of fft, T=0.02s');
