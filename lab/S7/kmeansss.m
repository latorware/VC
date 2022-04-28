% a partir de matlab 2022, imsegkmeans
I = imread('tiger.jpg'); 
figure
imshow(I); 
R = I(:,:,1); 
G = I(:,:,2); 
B = I(:,:,3); 
O = double([R(:) G(:) B(:)]); 
k = 16; %numero tintes
C = kmeans(O, k); 
[f c] = size(R); 
S = reshape(C, f, c); 
figure
L = labeloverlay(I, S); 
%L = label2rgb(S); 
imshow(L); 