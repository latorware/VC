I = rgb2gray(imread('cel_x2.jpg)); 
% h = imhist(I); 
% plot(h); 
BW = I < 180;
BW = imfill(BW, 'holes'); 
DE = bwdist(not(BW), 'euclidean'); 
BWDE = DE > 40; 
imshow(BWDE); 
