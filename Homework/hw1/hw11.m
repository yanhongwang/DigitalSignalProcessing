x=[3 -2 6 8 -1];
h=[2 5 0 -5 2 -3 1];
%(a)
y=conv(x,h);
figure();
stem(y);
xlabel('Sample');

%(b) The meaning of title is fuzzy
x1=[3 0 0 0 0];
x2=[0 -2 0 0 0];
x3=[0 0 6 0 0];
x4=[0 0 0 8 0];
x5=[0 0 0 0 -1];
conv(x1, h);
conv(x2, h);
conv(x3, h);
conv(x4, h);
conv(x5, h);

%(c)
y1=conv(x(1),h);
y2=conv(x(2),h);
y3=conv(x(3),h);
y4=conv(x(4),h);
y5=conv(x(5),h);
y1=[y1 0 0 0 0];
y2=[0 y2 0 0 0];
y3=[0 0 y3 0 0];
y4=[0 0 0 y4 0];
y5=[0 0 0 0 y5];
yall=y1+y2+y3+y4+y5;
figure();
stem(yall);
xlabel('Sample');
