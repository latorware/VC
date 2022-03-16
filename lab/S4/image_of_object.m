%% DISPLAYS ALL THE OBJECT IN DIFFERENT IMAGES (OBJECT PER IMAGE)
% V contains the image
B = imbinarize(V); 
[n,m] = bwlabel(B); 
C = zeros(height(n), length(n));
for x=0:m
    for i=1 : height(n)
        for j=1 : length(n)
            if n(i,j) == x
                C(i,j) = 1; 
            end
        end
    end
    figure
    imshow(C); 
    C = zeros(height(n), length(n)); 
end
