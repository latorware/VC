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


%% Binarització local
    %%Primer fem tophat per millorar il·luminació
h = imhist(imgTransformed);
figure
plot(h);

ha = cumsum(h);
figure
plot(ha);

    %%inversio per tophat
imgTransformed = 255 - imgTransformed; 
figure
imshow(imgTransformed); 

se = strel('disk',25);
imgTransformedfiltered = imtophat(imgTransformed,se);
figure
imshow(imgTransformedfiltered)

    %%tornem a inversio
imgTransformedfiltered = 255 - imgTransformedfiltered; 
figure
imshow(imgTransformedfiltered); 

    %%binaritzacio prova 1
%%binLocal1 = blkproc(imgTransformedfiltered, [1, 1], [25, 70], @myfun, 10); 
%%figure
%%imshow(binLocal1); 

    %%binaritzacio prova 2
%binLocal2 = blkproc(imgTransformedfiltered, [1, 1], [25, 70], @myfun, 40); 
%figure
%imshow(binLocal2); 

    %%binaritzacio prova 3
%binLocal3 = blkproc(imgTransformedfiltered, [1, 1], [25, 70], @myfun, 100); 
%figure
%imshow(binLocal3); 

    %%binaritzacio prova 4
%binLocal4 = blkproc(imgTransformedfiltered, [1, 1], [25, 70], @myfun, 60); 
%figure
%imshow(binLocal4); 

    %%binaritzacio prova 5
binLocal5 = blkproc(imgTransformedfiltered, [1, 1], [25, 70], @myfun, 50); 
figure
imshow(binLocal5); 

%nombre components
labeledImage = bwconncomp(binLocal5); 
labeledImage.NumObjects

% el vermell
measurements = regionprops(labeledImage,'BoundingBox');
for k = 1 : length(measurements)
    bb = measurements(k).BoundingBox;
    rectangle('Position', [bb(1),bb(2),bb(3),bb(4)],'EdgeColor','red','LineWidth',1 );
end

%% eliminar imperfeccions no necessari (a mes que fa que desapareguin simbols)
%se = strel('disk',2);
%T = imopen(binLocal5, se);
%binLocal5 = imreconstruct(T, binLocal5); 
%figure
%imshow(binLocal5)
