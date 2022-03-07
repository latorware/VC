%%Exercici 3

%% Càrrega d'imatges
%% Comparacio tres imatges que han de tenir les mateixes dimensions
I1 = rgb2gray(imread('_61A5845.jpg'));
I2 = rgb2gray(imread('_61A5855.jpg'));
I3 = rgb2gray(imread('_61A5861.jpg'));

% figure
% imshow(I1);
% figure
% imshow(I2);
% figure
% imshow(I3);

%% Filtre Sobel

S1 = Sobel(I1);
figure
imshow(S1); 
S2 = Sobel(I2);
figure
imshow(S2); 
S3 = Sobel(I3);
figure
imshow(S3);
% S4 = Sobel(I4);
%montage({I1,S1,I2, S2, I3, S3});

%% Histogrames de les imatges sobel senceres
figure
histogram(S1);
figure
histogram(S2);
figure
histogram(S3);

%% Histogrames de les imatges sobel (retallades perque nomes hi hagi els pixesl centrals)
% Subimatges que contenen els 10.000 (100x100) pixels més centrals de cada imatge
% respectivament
centreImatgex = double(size(S1, 2))/2.0; 
centreImatgey = double(size(S1, 1))/2.0;
S1cropped = imcrop(S1, [(centreImatgex - 50) (centreImatgey - 50) 100 100]); 
S2cropped = imcrop(S2, [(centreImatgex - 50) (centreImatgey - 50) 100 100]); 
S3cropped = imcrop(S3, [(centreImatgex - 50) (centreImatgey - 50) 100 100]); 
figure
imshow(S1cropped); 
figure 
histogram(S1cropped); 
figure
imshow(S2cropped); 
figure
histogram(S2cropped); 
figure
imshow(S3cropped); 
figure
histogram(S3cropped); 


%% Càlcul mètrica

[m1, M1, enf1] = Metrica(S1);
[m2, M2, enf2] = Metrica(S2);
[m3, M3, enf3] = Metrica(S3);

%% gràfica resultats
x = categorical(["Imatge1", "Imatge2", "Imatge3"]); 
y = [(m1) (m2) (m3)]; 
plot(x,y); 

%% Mostra la imatge amb major mètrica

figure
if m1>max(m2,m3)
    imshow(I1);
else
    if m2>max(m1,m3)
        imshow(I2);
    else
        imsow(I3);
    end
end

