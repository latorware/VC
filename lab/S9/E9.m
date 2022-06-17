close all

S = imread('sheeps.jpg');
figure
imshow(S);

Im = rgb2gray(S);
figure
imshow(Im);
r = getrect;

I = Im(r(2):r(2)+r(4), r(1):r(1)+r(3));
figure
imshow(I);



M = 32;
N = 32;
D = mydescriptor (imresize(I, [M,N]));

%%configurem la mida dels blocs perquè la mida sigui M x N (32x32)

step = 10;
h = round((M-step)/2); %round(r(4)/2 - step/2);
w = round((N-step)/2); %round(r(3)/2 - step/2);


blk = [h,w];
    
R = imresize(R,size(Im));
B = imoverlay(S,R,'y');
figure
imshow(B);