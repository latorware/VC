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
%imshow(Ac); 
%%
% Logaritme natural
Lnatural = L.*(1-log(L)); 
figure
Lnatural = rescale(Lnatural, 0, 1); 
imglognatural = convertFromHSL(H,S,Lnatural);
imshow(imglognatural); 

%% NO VALID
% Logaritme base 2
%Lb2 = L.*(1-log2(L)); 
%Lb2 = rescale(Lb2, 0, max(Lb2(:))); 
%figure
%imglogb2 = convertFromHSL(H,S,Lb2);
%imshow(imglogb2); 

% Logaritme base 10
Lb10 = L.*(1-log10(L)); 
figure
Lb10 = rescale(Lb10, 0, 1); 
imglogb10 = convertFromHSL(H,S,Lb10);
imshow(imglogb10); 

figure
montage({A, imglognatural, imglogb10});

% seguim amb logaritme natural
histlognatural = imhist(imglognatural); 
figure
plot(histlognatural); 
% 25/255 = 0.098 (aprox)
imglognatural = imadjust(imglognatural, [0.098, 1]); 
figure
imshow(imglognatural); 

[H,S,L] = convertToHSL(imglognatural);
%multipliquem saturació per: 1.65
S = S.*1.65; 
imglognatural = convertFromHSL(H,S,L);
figure
imshow(imglognatural); 



%% filtre mitjana(descartat)
%f = [1/16 1/8, 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
mitjana = imfilter(imglognatural, ones(9)/81, 'conv');
figure
imshow(mitjana);

%% filtre gaussià
gauss = imgaussfilt(imglognatural,2);
figure
imshow(gauss);

%% filtre mediana (descartat)
mediana = imglognatural; 
for c = 1 : 3
    mediana(:, :, c) = medfilt2(imglognatural(:, :, c), [8, 8]);
end 
figure
imshow(mediana);

%% comparació filtres
%figure
%montage({imglognatural, mitjana, gauss, mediana}); 

%% Resultat final (comparativa)
%montage({A, B, gauss}); 