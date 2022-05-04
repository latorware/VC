% a partir de matlab 2022, imsegkmeans
I = imread('yellowFrogSmall.jpg'); 
figure
imshow(I); 
rect = getrect;
HSV = rgb2hsv(I);

Hradians = HSV(:,:,1)*2*pi;
HangleX = cos(Hradians);
HangleY = sin(Hradians);
S = HSV(:,:,2);
V = HSV(:,:,3);
[sizeH, sizeS, sizeV] = size(HSV);
k = 15; 
O = double([HangleX(:) HangleY(:) S(:) V(:)]); 
C = kmeans(O, k); 
S = reshape(C, sizeH, sizeS); 
%figure
%L = labeloverlay(I, S); 
figure
L = label2rgb(S); 
imshow(L)

MASK = zeros(sizeH, sizeS); 
MASK(rect(2):(rect(2) + rect(4)), rect(1):(rect(1) + rect(3))) = 1; 
figure
imshow(MASK)
