I = imread('rice.png'); 
BW = I > 120; 
[f,c] = size(BW); 
BWB = false([f, c]); 
BWB(1, :) = true; %marc de un pixel
BWB(end, :) = true; 
BWB(:, end) = true; 
BWB(:, 1) = true; 
IR = imreconstruct(BWB, BW); 
%imshow(IR)
R = and(BW, not(IR)); 
%imshow(R)
EE = strel('disk', 3); 
FR = imopen(R, EE); 
%imshow(FR)

%S = bwmorph(FR, 'skel', Inf); 
S = bwmorph(S, 'spur', 6);

imshow(S); 