function RGB = convertFromHSL(H,SL,L)
% convertFromHSL Converts image from HSL to RGB colorspace
% https://en.wikipedia.org/wiki/HSL_and_HSV

% Convert from HSL to HSV
% HV = HL = H;
V = L+SL.*min(L, 1-L);
SV = 2*(1-L./V);
SV(V==0) = 0;

HSV = cat(3,H,SV,V);

RGB = hsv2rgb(HSV);

end