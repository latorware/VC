%%Exercici 3

%% Càrrega d'imatges

I1 = rgb2gray(imread('E3/_61A5845.jpg'));
I2 = rgb2gray(imread('E3/_61A5855.jpg'));
I3 = rgb2gray(imread('E3/_61A5861.jpg'));

% figure
% imshow(I1);
% figure
% imshow(I2);
% figure
% imshow(I3);

%% Filtre Sobel

S1 = Sobel(I1);
S2 = Sobel(I2);
S3 = Sobel(I3);
S4 = Sobel(I4);
%montage({I1,S1,I2, S2, I3, S3});

%% Histogrames pel càlcul del llindar
figure
histogram(S1);
figure
histogram(S2);
figure
histogram(S3);

%% Càlcul mètrica

m1 = Metrica(S1);
m2 = Metrica(S2);
m3 = Metrica(S3);

%% Mostra la imatge amb major mètrica

if m1>max(m2,m3)
    imshow(I1);
else
    if m2>max(m1,m3)
        imshow(I2);
    else
        imsow(I3);
    end
end

