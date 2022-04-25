%%

I = rgb2gray(imread('full.jpg'));
imshow(I);
h = imhist(I);
figure
plot(h);

%%
% ee = strel("disk", 12);
% th = imclose(I,ee);
% th = th - I;
% 
% figure
% imshow(th);

%%
ha = cumsum(h);
figure
plot(ha);