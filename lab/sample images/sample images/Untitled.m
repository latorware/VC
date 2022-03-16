I = rgb2gray(imread('bigben.png'));

%N = imnoise(I,'salt & pepper',0.1);
%montage({I,N});

N = imnoise(I,'gaussian',0,0.1);
%montage({I,N});

%h = [1,1,1;1,1,1;1,1,1];
%h = h/9;
%F = imfilter(N,h);
%montage({I,N,F});

% h = ones(7,7);
% h = h/sum(sum(h)); %Normalització (suma = 1)
%F = imfilter(N,h);
%montage({I,N,F});

% h = fspecial('gaussian',11,11/5);
% F = imfilter(N,h);
% montage({I,N,F});

% h = [0 0 0 0 0 0 0 1 1 1 1 1 1 1]; %desplaça cap a l'esquerra
% h = h/sum(h);
% F = imfilter(I,h);
% montage({I,F});

% h = fspecial('motion',50,0);
% h = fspecial('motion',50,45);
% F = imfilter(I,h);
% montage({I,F});

% h = fspecial('gaussian',11,11/5);
% F = imfilter(I,h);
% NF = medfilt2(I);
% montage({I,N,F, NF});

% DF = stdfilt(I);
% %DF = double(DF)/max(DF,[],'all');
% imshow(DF, []);
%montage({I,DF});

h = fspecial('laplacian');
F = imfilter(I,h);
montage({I,F});



