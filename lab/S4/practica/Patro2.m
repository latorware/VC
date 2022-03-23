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
%{
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
        
        figure
        imshow(imreconstruct(A, BW))
%}
% triangles

%{
for i = 40:90
    EE5 = strel('line', 15, i); 
    B = imopen(BW, EE5); 
    figure
    imshow(B)
end
%}


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


D= imreconstruct(D, BW); 
figure
imshow(D)
F = and(B, D); 

figure
imshow(F)


EE25 = strel('square', 40); 
F = imclose(F, EE25); 
figure
imshow(F)









%{
%% alternativa


EE5 = strel('line', 5, 53); 
B = imopen(BW, EE5); 
%figure
%imshow(B)

EE15 = strel('line', 5, 125); 
D = imopen(BW, EE15); 
%figure
%imshow(D)

B = and(B, D); 
figure
imshow(B); 

EE6 = strel('square', 5); 
B = imclose(B, EE6); 
%figure
%imshow(B)

EE8 = strel('disk', 3, 8); 
B = imclose(B, EE8); 
%figure
%imshow(B)

EE7 = strel('square', 5); 
B = and(B, not(imopen(B, EE7))); 
%figure
%imshow(B); 

EE9 = strel('line', 5, 53); 
B = imopen(B, EE9); 
figure
imshow(B);

EE16 = strel('line', 5, 125); 
D = imopen(B, EE16); 
figure
imshow(D);

B = and(B, D);
figure
imshow(B)

EE10 = strel('square', 26); 
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
%}





%%
%{
IMG = imread('24486978.bmp');
IMG(:,:,1) = IMG(:,:,1) .* uint8(not(FINAL));
IMG(:,:,3) = IMG(:,:,3).* uint8(not(FINAL));
IMG(:,:,2) = IMG(:,:,2) + uint8(FINAL)*255;

figure
imshow(IMG);
%}