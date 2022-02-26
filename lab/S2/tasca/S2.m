clear
clc
close all

%% 1
A = double(imread('_MG_7735.JPG'))/255;
B = double(imread('_MG_7737.JPG')) /255;


%% 2
DIF = abs(A-B); % imatge diferencia
maxim = max(DIF(:));
DIF = DIF/maxim; % dividim pel seu valor màxim
imshow(DIF);


%% 3
Bd = imtranslate(B,[20, -20]);
DIF = abs(A-Bd);
maxim = max(DIF(:));
DIF = DIF/maxim;
figure
imshow(DIF);

%% 4
Am = (A+Bd)/2; % imatge sumatori amb més senyal que A i B
Ac = Am; 
hist1 = imhist(Ac);
figure
plot(hist1); 

[H,S,L] = convertToHSL(Ac);


figure
montage({A, Ac}); 