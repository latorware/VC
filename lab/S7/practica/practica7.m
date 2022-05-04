
%% O NOMES TE HSV
%{
I = imread('yellowFrogSmall.jpg'); 
%I = imread('yellowFrog.jpg'); 
%I = imread('car.jpg');
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
%k = 20; 
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
%}

%% O NOMES TE RGB
%{
I = imread('yellowFrogSmall.jpg'); 
%I = imread('yellowFrog.jpg'); 
%I = imread('car.jpg');
figure
imshow(I); 
rect = getrect;

[sizeH, sizeS, sizeV] = size(I);
k = 10; 
%k = 15; 
%k = 20; 
R = I(:,:,1); 
G = I(:,:,2); 
B = I(:,:,3); 
O = double([R(:) G(:) B(:)]); 
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
%}



%% O TE HSV MENYS EL V
%{
I = imread('yellowFrogSmall.jpg'); 
%I = imread('yellowFrog.jpg'); 
%I = imread('car.jpg');
figure
imshow(I); 
rect = getrect;
HSV = rgb2hsv(I);

Hradians = HSV(:,:,1)*2*pi;
HangleX = cos(Hradians);
HangleY = sin(Hradians);
S = HSV(:,:,2);
[sizeH, sizeS, sizeV] = size(HSV);
k = 10; 
%k = 15; 
%k = 20; 
O = double([HangleX(:) HangleY(:) S(:)]); 
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
%}

%% O TE Cielab
%{
I = imread('yellowFrogSmall.jpg'); 
%I = imread('yellowFrog.jpg'); 
%I = imread('car.jpg');
figure
imshow(I); 
rect = getrect;
Cielab = rgb2lab(I); 

[sizeH, sizeS, sizeV] = size(I);
k = 10; 
%k = 15; 
%k = 20; 
Luminance = Cielab(:,:,1); 
RedGreen = Cielab(:,:,2); 
BlueYellow = Cielab(:,:,3); 
O = double([Luminance(:) RedGreen(:) BlueYellow(:)]); 
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
%}

%% O TE HSV I TAMBE RGB I TAMBE EL CIELAB
I = imread('yellowFrogsmall.jpg'); 
%I = imread('yellowFrog.jpg'); 
%I = imread('car.jpg');

figure
imshow(I); 
rect = getrect;
HSV = rgb2hsv(I);
Cielab = rgb2lab(I); 

Hradians = HSV(:,:,1)*2*pi;
HangleX = cos(Hradians);
HangleY = sin(Hradians);
S = HSV(:,:,2);
V = HSV(:,:,3);

Luminance = Cielab(:,:,1); 
RedGreen = Cielab(:,:,2); 
BlueYellow = Cielab(:,:,3); 

[sizeH, sizeS, sizeV] = size(I);
k = 10; 
%k = 15; 
%k = 20; 
R = I(:,:,1); 
G = I(:,:,2); 
B = I(:,:,3); 
O = double([R(:) G(:) B(:) HangleX(:) HangleY(:) S(:) V(:) Luminance(:) RedGreen(:) BlueYellow(:)]); 
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
