clear
close all

%% Llegir imatge
I = imread('24486978.bmp');
I = rgb2gray(I);
 %imshow(I);

%% Decisió de llindar
h = imhist(I);
%figure
%plot(h);

BW = I > 200;
figure
imshow(BW);

%% Patró 2

EE = strel('square', 24); 
A = imdilate(BW, EE); 
figure
imshow(A)
EE2 = strel('line', 10, 0); 
A = imerode(A, EE2); 
figure
imshow(A)


%%
%{
IMG = imread('24486978.bmp');
IMG(:,:,1) = IMG(:,:,1) .* uint8(not(FINAL));
IMG(:,:,3) = IMG(:,:,3).* uint8(not(FINAL));
IMG(:,:,2) = IMG(:,:,2) + uint8(FINAL)*255;

figure
imshow(IMG);
%}