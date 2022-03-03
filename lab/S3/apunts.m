I = rgb2gray(imread('bigben.png')); 
N = I; 
F = I; 
DF = I; 
%N = imnoise(I, 'salt & pepper', 0.1);
%N = imnoise(I, 'gaussian',0, 10/255); 

%h = [1 1 1; 1 1 1; 1 1 1]/9; 
%h = ones(7,7); 
%h = h/sum(sum(h)); 
%h = fspecial('gaussian', 5, 1); 
%h = [zeros(1,10) ones(1,10)]/10; 
%F = imfilter(N, h);

%DF = stdfilt(I);
%DF = double(DF)/ max(DF, [], 'all'); %alternativament imshow(DF, [])

%DF = fspecial('laplacian'); 
%DF = imfilter(I, DF);

%detectar canvi horitzontal
h = [1 0 -1; 1 0 -1; 1 0 -1]; %derivatius han de sumar 0, integratius sumen 1
GV = imfilter(I, h); 

%detectar canvi vertical
h = [1 0 -1; 1 0 -1; 1 0 -1]; 
h = h'; 
GH = imfilter(I, h); 

%detectar tots canvis
G = GH + GV; 

%sobel igual que en laplacian pero es te en compte distancia veins
h = fspecial('sobel'); 
DF = imfilter(I, h); 

montage({I, GV, GH, G, DF}); 
%montage({I,N,F, DF}); 