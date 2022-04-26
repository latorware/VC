%%

I = rgb2gray(imread('full.jpg'));
imshow(I);
h = imhist(I);
figure
plot(h);

%%
% ee = strel("disk", 4000);
% th = imopen(I,ee);
% th = I - th;
%  
% figure
% imshow(th);

%%
ha = cumsum(h);
figure
plot(ha);


%% Binarització per àrea
[files, columnes] = size(I);
mida = files*columnes;
Area = 0.4 * mida; % tan per cent de la imatge a blanc
b = ha > Area; %vector binar amb 0 i 1.
llindar = find(b,1); %busca el primer element a 1
B = I > llindar;

figure
imshow(B);

%% Binarització simple

C = I > 120;
figure
imshow(C);



%% retall de la imatge amb el marges
[rows, columns] = find(B);
row1 = min(rows);
row2 = max(rows);
col1 = min(columns);
col2 = max(columns);

RI = I(row1:row2, col1:col2, :);
figure
imshow(RI);


%% refem la imatge
[filesR, columnesR] = size(RI);
fixedPoints=[1 1;columnesR 1; columnesR filesR; 1 filesR]; %(x,y) coordinate
movingPoints=[1 113;3305 1;3361 2426;76 2392];

TFORM = fitgeotrans(movingPoints,fixedPoints,'projective');
RE=imref2d(size(RI),[1 size(RI,2)],[1 size(RI,1)]);
imgTransformed=imwarp(RI,RE,TFORM,'OutputView',RE);
figure
imshow(imgTransformed,[]);


%%
