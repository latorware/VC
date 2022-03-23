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

% Diagonal central

EE = strel('diamond', 15); 
A = imopen(BW, EE); 
figure
imshow(A)
    
        % Eliminar petits espuris
      
EE2 = strel('diamond', 16); 
A = and(A, not(imopen(A, EE2))); 
figure
imshow(A)

%EE3= strel('line', 35, 90); 
%A = and(A, not(imopen(A, EE3))); 
%figure
%imshow(A)


%%
%{
IMG = imread('24486978.bmp');
IMG(:,:,1) = IMG(:,:,1) .* uint8(not(FINAL));
IMG(:,:,3) = IMG(:,:,3).* uint8(not(FINAL));
IMG(:,:,2) = IMG(:,:,2) + uint8(FINAL)*255;

figure
imshow(IMG);
%}