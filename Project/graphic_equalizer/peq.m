% peq.m - Parametric EQ with matching gain at Nyquist frequency
%
% Usage: [b, a, G1] = peq(G0, G, GB, w0, Dw)
%
% G0 = reference gain at DC
% G  = boost/cut gain
% GB = bandwidth gain
%
% w0 = center frequency in rads/sample
% Dw = bandwidth in rads/sample
% NdB = amount of db less than the peak/notch gain as the bandwidth frequencies
% b  = [b0, b1, b2] = numerator coefficients
% a  = [1,  a1, a2] = denominator coefficients
% G1 = Nyquist-frequency gain
%
function [b, a, G1] = peq(G0, G, w0, Dw, NdB)

%Convert from Decibels to real values
GB = G * NdB;
G  = (10^(G/20));
GB = (10^(GB/20));
G0 = (10^(G0/20));

F   = abs(G^2  - GB^2);
G00 = abs(G^2  - G0^2);
F00 = abs(GB^2 - G0^2);

num = G0^2 * (w0^2 - pi^2)^2 + G^2 * F00 * pi^2 * Dw^2 / F;
den = (w0^2 - pi^2)^2 + F00 * pi^2 * Dw^2 / F;

G1 = sqrt(num/den);

G01 = abs(G^2  - G0*G1);
G11 = abs(G^2  - G1^2);
F01 = abs(GB^2 - G0*G1);
F11 = abs(GB^2 - G1^2);

W2 = sqrt(G11 / G00) * tan(w0/2)^2;
DW = (1 + sqrt(F00 / F11) * W2) * tan(Dw/2);

C = F11 * DW^2 - 2 * W2 * (F01 - sqrt(F00 * F11));
D = 2 * W2 * (G01 - sqrt(G00 * G11));

A = sqrt((C + D) / F);
B = sqrt((G^2 * C + GB^2 * D) / F);

b = [(G1 + G0*W2 + B), -2*(G1 - G0*W2), (G1 - B + G0*W2)] / (1 + W2 + A);
a = [1, [-2*(1 - W2), (1 + W2 - A)] / (1 + W2 + A)];