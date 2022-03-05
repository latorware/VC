%%Exercici 3

%% Càrrega d'imatges

I1 = rgb2gray(imread('E3/_61A5845.jpg'));
I2 = rgb2gray(imread('E3/_61A5855.jpg'));
I3 = rgb2gray(imread('E3/_61A5861.jpg'));

%% Filtre Sobel

S1 = Sobel(I1);
S2 = Sobel(I2);
S3 = Sobel(I3);
montage({I1,S1,I2, S2, I3, S3});
