% a partir de matlab 2022, imsegkmeans
I = imread('yellowFrogSmall.jpg'); 
figure
imshow(I); 
rect = getrect;
HSV = rgb2hsv(I);

Hradians = HSV(:,:,1)*2*pi;
HangleX = cos(Hradians);
HangleY = sin(Hradians);
S = HSV(:,:,2);
V = HSV(:,:,3);
[sizeH, sizeS, sizeV] = size(HSV);
k = 10; 
%k = 15; 
%K = 20; 
O = double([HangleX(:) HangleY(:) S(:) V(:)]); 
[C, L] = kmeans(O, k); 
S = reshape(C, sizeH, sizeS); 
figure
LL = label2rgb(S); 
imshow(LL)

MASK = false(sizeH, sizeS); 
MASK(rect(2):(rect(2) + rect(4)), rect(1):(rect(1) + rect(3))) = true; 
figure
imshow(MASK)
H = [C, MASK(:)];

H0 = zeros(k, 1); %caigut a dins
H1 = zeros(k, 1); %caigut a fora
for i = 1:(sizeH*sizeS)
    if (H(i, 2) == 1)
        H0(H(i, 1)) = H0(H(i, 1)) +1; 
    else
        H1(H(i, 1)) = H1(H(i, 1)) +1; 
    end
end

RES = H0 > H1;  %1 si hi ha mes el color a dins

M = false(sizeH, sizeS); 
for i = 1:sizeH
    for j = 1:sizeS
        if (RES(S(i, j)))
            M(i,j) = true; 
        end
    end
end
%Resultat brut
figure
imshow(M); 

%Resultat final
se = strel('disk',2);
M = imopen(M, se); 
figure
imshow(M); 

