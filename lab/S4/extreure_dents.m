% extreure dents
I = rgb2gray(imread('wheel.bmp')); 
%BW = I < 20; 
BW = imbinarize(I); 
BW = imfill(BW, 'holes'); 
EE = strel('circle', 8); 
EI = imerode(BW, EE); 
DI = imdilate(BW, EE); 
OI = imopen(BW, EE); 
CI = imclose(BW, EE);
%montage({BW, EI, DI, OI, CI}); 
R = and(BW, not(OI)); 
montage({BW, R}); 