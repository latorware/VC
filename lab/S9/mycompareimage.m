function [b] = mycompareimage(I, D)
DI = mydescriptor(I); 
dist = sum(abs(DI-D)); 
%[f c] = size(I); 
%s = sum(D); 
%factor = 1; 
llindar = 230; %numel(D) * factor; 
b = dist < llindar; 
end

