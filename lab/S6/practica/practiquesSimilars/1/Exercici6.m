I = rgb2gray(imread('mala_ilum.jpeg'));


J = I>50;

disk = strel('disk',50);
J = imclose(J,disk);

R = imcrop(I,[0,0,1050,1500]);

F = colfilt(R,[5 5], 'sliding', @myfunction);
CC = bwconncomp(F);

%labeledImage = bwconncomp(BW);
%measurements = regionprops(labeledImage,'BoundingBox');



imshow(F);