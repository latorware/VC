function [D] = mydescriptor(I)
%D = imhist(I); 
I = imresize(I, [32,32]); 
%[D, V] = extractHOGFeatures(I, 'CellSize',[8,8]); 
%D = extractHOGFeatures(I, 'CellSize',[8,8]); 
D = extractLBPFeatures(I, 'CellSize',[4,4]); 



%{
subplot(1,2,1); 

imshow(I); 
subplot(1,2,2); 
plot(V); 
drawnow
%}
end

