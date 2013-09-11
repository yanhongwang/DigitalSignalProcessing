x1=[6 5 4  3 2 1];
x2=[1 0 0 0 1];
y_circular_6=cconv(x1,x2,6);
y_circular_10=cconv(x1,x2,10);
y_linear=conv(x1,x2);

figure();
stem(y_circular_6);
xlabel('Sample');

figure();
stem(y_circular_10);
xlabel('Sample');

figure();
stem(y_linear);
xlabel('Sample');
