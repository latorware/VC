%% Llegir imatge
I = imread('24486978.bmp');
I = rgb2gray(I);
figure
imshow(I);

%% Decisió de llindar
h = imhist(I);
figure
plot(h);

BW = I > 200;
figure
imshow(BW);

%% Patró 1

%% Marges
EE = strel('line', 30, 45);
OI = imerode(BW,EE);
EE2 = strel('square', 10);
OI2 = imerode(OI,EE2);


EE = strel('line', 30, 135);
OI4 = imerode(BW,EE);
EE2 = strel('square', 10);
OI3 = imerode(OI4,EE2);

MIX = or(OI2,OI3);
figure
montage({OI,OI4});
figure
imshow(MIX);

%%
EE3 = strel('square', 20);
OI4 = imopen(MIX, EE3);

MIX2 = and(MIX,not(OI4));
RC = imreconstruct(MIX2,BW);
figure
imshow(RC);

%% Córners

EE = strel('disk', 4);
OI = imopen(BW,EE);
OI = imreconstruct(OI,BW);


OI2 = and(BW, not(OI));
figure
imshow(OI2);

EE = strel('square', 6);
OI3 = imopen(OI2,EE);


EE = strel('square', 5);
OI4 = imopen(OI2,EE);

OI5 = and(OI4, not(OI3));
OI5 = imreconstruct(OI5, BW);

imshow(OI5);

%%
EE = strel('line', 9, 0);
OI6 = imopen(OI5,EE);


EE2 = strel('line', 9, 90);
OI7 = imopen(OI5,EE2);
figure
montage({OI6,OI7});

OI8 = and(OI6,OI7);
figure
imshow(OI8);

%%
EE3 = strel('disk', 22);
OI9 = imdilate(OI8,EE3);
figure
imshow(OI9);
%%
EE3 = strel('disk', 23);
OI10 = imopen(OI9,EE3);

EE4 = strel('disk', 22);
OI11 = imopen(OI9,EE4);

OI12=and(not(OI10),OI11);
figure


EE4 = strel('disk', 22);
OI13 = imopen(OI12,EE4);

figure
imshow(OI13);

%%
EE5 = strel('line', 43, 90);
OI14 = imopen(OI13,EE5);

EE6 = strel('line', 44, 90);
OI15 = imopen(OI13,EE6);

OI16 = and(not(OI15),OI14);

EE7 = strel('rectangle',[41 18]);
OI16 = imerode(OI16,EE7);

figure
imshow(OI16);

OI16 = imreconstruct(OI16,BW);

figure
imshow(OI16);

%%

EE8 = strel('line',11 , 135);
OI17 = imerode(OI16,EE8);

EE9 = strel('line',13 , 45);
OI18 = imerode(OI16,EE9);
OI19 = or(OI18,OI17);
OI19 = imreconstruct(OI19,BW);

figure
imshow(OI19);

%%
EE10 = strel('disk', 60);
OI20 = imdilate(OI19,EE10);

figure
imshow(OI20);

EE11 = strel('square', 100);
OI20 = imopen(OI20,EE11);

OI21 = and(OI20, OI19);
figure
imshow(OI21);

%%
RC2 = or(RC,OI21);
figure
imshow(RC2);

%%
EE12 = strel('diamond', 8);
OI22 = imopen(BW,EE12);

EE13 = strel('diamond', 9);
OI23 = imopen(BW,EE13);

OI24 = and(not(OI23),OI22);


figure
imshow(OI24);

%%

EE14 = strel('disk', 3);
OI25 = imopen(OI24,EE14);

figure
imshow(OI25);

EE15 = strel('disk', 30);
OI26 = imdilate(OI25,EE15);


EE16 = strel('line', 72, 90);
OI27 = imopen(OI26,EE16);

EE17 = strel('line', 71, 90);
OI28 = imopen(OI26,EE17);

OI28 = and(not(OI27),OI28);

figure
imshow(OI28);
%%
EE18 = strel('rectangle',[72 31]);
OI29 = imerode(OI28,EE18);
OI29 = imreconstruct(OI29,BW);

figure
imshow(OI29);
%%
EE19 = strel('disk', 7);
OI30 = imopen(OI29,EE19);

EE20 = strel('disk', 6);
OI31 = imopen(OI29,EE20);
OI31 = and(not(OI30), OI31);

OI31 = imopen(OI31,EE20);


%%
RC3 = imreconstruct(OI31,BW);

figure
imshow(RC3);

%%
FINAL = or(RC,RC2);
FINAL = or(FINAL,RC3);

figure
imshow(FINAL);


%%

IMG = imread('24486978.bmp');
IMG(:,:,1) = IMG(:,:,1) .* uint8(not(FINAL));
IMG(:,:,3) = IMG(:,:,3).* uint8(not(FINAL));
IMG(:,:,2) = IMG(:,:,2) + uint8(FINAL)*255;

figure
imshow(IMG);
