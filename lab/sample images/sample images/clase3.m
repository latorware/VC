I=rgb2gray(imread('bigben.png'));
N=imnoise(I,'salt & pepper', 0.1);
NG=imnoise(I,'gaussian',0,5/255);

%h=ones(10,10);
%h=h/sum(h,'all');
%h=fspecial('average',10);
%h=fspecial('gaussian',11,11/5);

%F=medfilt2(N);
%F=medfilt2(F);
h=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
h=h/sum(h,'all');
F=stdfilt(I);
imshow(F,[]);