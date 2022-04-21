I = rgb2gray(imread('tiger.jpg')); 
J = blkproc(I, [1, 1], [50, 50], @myfun2, 16); 
figure
imshow(J, []); 