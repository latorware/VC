clc
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
        A = imopen(A, EE); 
        figure
        imshow(A)
        
        EE3 = strel('square', 16);
        %A = imopen(A, EE3); 
        A = and(A, not(imopen(A, EE3))); 
        figure
        imshow(A)
        EE4 = strel('diamond', 10); 
        A = imopen(A, EE4); 
        figure
        imshow(A)
        
        A = imreconstruct(A, BW); 
        figure
        imshow(A)

%% Triangles grans

% 55 graus

EE5 = strel('line', 22, 53); 
B = imopen(BW, EE5); 
%figure
%imshow(B)

EE6 = strel('square', 10); 
B = imclose(B, EE6); 
%figure
%imshow(B)

EE8 = strel('disk', 5, 8); 
B = imclose(B, EE8); 
%figure
%imshow(B)

EE7 = strel('square', 5); 
B = and(B, not(imopen(B, EE7))); 
%figure
%imshow(B); 

EE9 = strel('line', 22, 53); 
B = imopen(B, EE9); 
figure
imshow(B);

EE10 = strel('square', 38); 
B = imclose(B, EE10); 
figure
imshow(B)

EE12 = strel('disk', 5, 8); 
B = and(B, not(imopen(B, EE12))); 
figure
imshow(B); 

B = imreconstruct(B, BW); 
figure
imshow(B)



% 125 graus

EE15 = strel('line', 22, 125); 
D = imopen(BW, EE15); 
%figure
%imshow(D)

EE16 = strel('square', 10); 
D = imclose(D, EE16); 
%figure
%imshow(D)

EE18 = strel('disk', 5, 8); 
D = imclose(D, EE18); 
%figure
%imshow(D)

EE17 = strel('square', 5); 
D = and(D, not(imopen(D, EE17))); 
%figure
%imshow(D); 

EE19 = strel('line', 23, 125); 
D = imopen(D, EE19); 
figure
imshow(D);

EE20 = strel('square', 30); 
D = imclose(D, EE20); 
figure
imshow(D)

EE22 = strel('disk', 1, 8); 
D = and(D, not(imopen(D, EE22))); 
figure
imshow(D); 

%% interseccio 55 i 120 graus

D= imreconstruct(D, BW); 
figure
imshow(D)
F = and(B, D); 

figure
imshow(F)

%% eliminar espuris pels triangles grans

EE25 = strel('square', 40); 
F = imclose(F, EE25); 
%figure
%imshow(F)

EE26 = strel('square', 21); 
F = and(F, not(imopen(F, EE26))); 
%figure
%imshow(F)

EE27 = strel('rectangle', [40, 5]); 
F = and(F, not(imopen(F, EE27))); 
%figure
%imshow(F)

EE28 = strel('rectangle', [38, 5]); 
D = imopen(F, EE28); 
%figure
%imshow(D)

EE29 = strel('rectangle', [10, 28]); 
F = imopen(F, EE29); 
%figure
%imshow(F)

F = or(F, D); 
%figure
%imshow(F)

F = imreconstruct(F, BW); 
%figure
%imshow(F)


%% els triangles petits

EE31 = strel('disk', 6, 8); 
W = imopen(BW, EE31); 
figure
imshow(W)

EE31 = strel('square', 10); 
E = imopen(BW, EE31); 
figure
imshow(E)

EE31 = strel('diamond', 6); 
R = imopen(BW, EE31); 
figure
imshow(R)

T = or(W, E); 
T = or(T, R); 
figure
imshow(T)

T = and(BW, not(imreconstruct(T, BW))); 
figure
imshow(T)


EE30 = strel('line', 13, 90); 
W = imopen(T, EE30); 
figure
imshow(T)

EE31 = strel('line', 13, 0); 
D = imopen(T, EE31); 
figure
imshow(D)


T = and(D, W); 
figure
imshow(T)

EE32 = strel('square', 3); 
T = imopen(T, EE32); 
figure
imshow(T)

EE33 = strel('line', 6, 45); 
D = imopen(T, EE33); 
figure
imshow(D)

T = imreconstruct(T, BW); 
D = imreconstruct(D, BW); 
T = and(T, not(D)); 
figure
imshow(T)


EE34 = strel('square', 50); 
T = imclose(T, EE34); 
figure
imshow(T)

EE35 = strel('square', 10); 
D = imopen(T, EE35); 
figure
imshow(D)

T = imreconstruct(T, BW); 
D = imreconstruct(D, BW); 
T = and(T, not(D)); 
figure
imshow(T)

EE36 = strel('square', 70); 
D = imclose(T, EE36); 
figure
imshow(D)

EE37 = strel('line', 20, 0);
D = imopen(D, EE37); 
figure
imshow(D)

T = and(T, D); 
figure
imshow(T)

T = imreconstruct(T, BW); 
figure
imshow(T)


FINAL = or(A, F); 
FINAL = or(FINAL, T); 
figure
imshow(FINAL)


IMG = imread('24486978.bmp');
IMG(:,:,1) = IMG(:,:,1) .* uint8(not(FINAL));
IMG(:,:,3) = IMG(:,:,3).* uint8(not(FINAL));
IMG(:,:,2) = IMG(:,:,2) + uint8(FINAL)*255;

figure
imshow(IMG);