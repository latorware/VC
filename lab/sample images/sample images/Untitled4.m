I = imread('coins.png');
N = arrayfun(@(x) 255 -x,I);
imshow(N)