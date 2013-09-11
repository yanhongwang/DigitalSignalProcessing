h=[1, 2.57873, 3.4975, 2.5071, 1.266];
h_min=[1.5625 2.8916 3.3906 2.1945 0.8100];
h_ap_x=[0.64 1.2944 1];
h_ap_y=[1 1.2944 0.64];

%1-1
figure();
zplane(h);
%1-2
figure();
zplane(h_min);
%1-3
figure();
zplane(h_ap_x, h_ap_y);

%2
h_min_result=dfilt.df1(h_min);
freqz(h_min_result);
grpdelay(h_min_result);

%3
h_result=dfilt.df1(h);
freqz(h_result);

%4
impz(h_result);
impz(h_min_result);
