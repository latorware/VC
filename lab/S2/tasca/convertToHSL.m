function [H,SL,L] = convertToHSL(RGB)
%convertToHSL Converts image from RGB to HSL colorspace
% https://en.wikipedia.org/wiki/HSL_and_HSV

HSV = rgb2hsv(RGB);

% Convert from HSV to HSL
% HL = HV = H;
H = HSV(:,:,1);
SV = HSV(:,:,2);
V = HSV(:,:,3);

L = V-(0.5.*V.*SV);

SL = (V-L) ./ min(L, 1-L);
SL(L==0 | L==1) = 0;
end