clc
close all
clear

I = rgb2gray(imread('cellsegmentationcompetition.png'));
figure
imshow(I)

IB = I > 200; 
SB = false(size(I)); 
SB(1,:) = 1; 
SB(:,1) = 1; 
SB(end, :) = 1; 
SB(:, end) = 1; 
RB = imreconstruct(SB, IB); 
figure
imshow(RB)
RB = imdilate(RB, strel('disk', 2)); 
figure
imshow(RB)
I(RB) = 0; %tots pixels que estiguin a 1 a RB, posarlos a 0
figure
imshow(I)

OI = imopen(I, strel('disk', 4)); 
CI = imclose(I, strel('disk', 4));
FI = imclose(OI, strel('disk', 4)); 
figure
montage({I, OI, CI, FI}); 


BW = I > 16; 
figure
imshow(BW)

BW = bwareaopen(BW, 120); 
RGB = imoverlay(FI, not(BW), 'red'); 

% separacio de les celules
DT = imcomplement(bwdist(not(BW)));
figure
imshow(DT, [])
DT = imclose(DT, strel('disk', 7)); %filtre de la DT intentant eliminar
% petits pous entre una celula
DT(not(BW)) = -Inf;  % evitar el vessament d'aigua en el BKG
L = watershed(DT); 
%RGB = label2rgb(L, 'jet'); 
BD = L ==0; 


%identificar nuclis
AT = FI; 
AT = imopen(AT, strel('disk', 7, 8)); 
figure
imshow(AT)
AT(not(BW)) = 255;
figure
imshow(AT)
AT = imregionalmin(AT); 
figure
montage({I, AT}); 

AT = imopen(AT, strel('disk', 2, 8)); 
figure
montage({I, AT}); 

AT = or(BD, AT); 
figure
montage({I, AT}); 

RGB = imoverlay(I, AT, 'yellow');
figure
montage({I, RGB})


figure
imshow(BD)