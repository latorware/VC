I = rgb2gray(imread('BritishCoins.jpg')); 
imshow(I); 
h = imhist(I); 
figure
plot(h);
ha = cumsum(h); % histograma acumulat
figure
plot(ha);
[f, c] = size(I); 
mida = f * c; 
Area = 0.25*mida; % tant per cent de la imatge a blanc
b = ha > Area; 
llindar = find(b,1); % busca el primer element a 1
B = I < llindar; 
figure
imshow(B); 
ee = strel('disk', 4); 
BC = imclose(B,ee); 
figure
imshow(BC); 

C = bwconncomp(BC); 
J = BC; 
J(C.PixelIdxList{1}) = 0; % treu el element numero 1
npixels = cellfun(@numel, C.PixelIdxList); 
[v,i] = max(npixels); 
J(C.PixelIdxList{i}) = 0; % treu el element mes gran
figure
montage({BC, J}); 