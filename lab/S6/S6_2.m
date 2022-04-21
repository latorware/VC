I = rgb2gray(imread('britishCoins.jpg')); 
J = blkproc(I, [1, 1], [3, 3], @myfun, 232); 
figure
imshow(J); 