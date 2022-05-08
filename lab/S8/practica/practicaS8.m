i = rgb2gray(imread('joc_de_caracters.jpg')); 
figure
imshow(i); 

IB = i < 128; 
figure
imshow(IB); 

CC = bwconncomp(IB); 
prop = regionprops('table', CC, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C1 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C2 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C3 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C4 = prop.FilledArea ./ prop.Area; 
C5 = prop.EulerNumber; 
C6 = prop.Eccentricity;
C7 = prop.Solidity; 
C8 = prop.Extent; 
C9 = prop.MaxFeretAngle; 
C10 = prop.MinFeretAngle; 

X = [C1 C2 C3 C4 C5 C6 C7 C8 C9 C10]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 





i = rgb2gray(imread('joc_de_caracters.jpg')); 
i = imresize(i, 2); 
IB = i < 128; 
figure
imshow(IB); 

CC = bwconncomp(IB); 
prop = regionprops('table', CC, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C1 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C2 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C3 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C4 = prop.FilledArea ./ prop.Area; 
C5 = prop.EulerNumber; 
C6 = prop.Eccentricity;
C7 = prop.Solidity; 
C8 = prop.Extent; 
C9 = prop.MaxFeretAngle; 
C10 = prop.MinFeretAngle; 
X = [C1 C2 C3 C4 C5 C6 C7 C8 C9 C10]; 
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 

%app classification learner
Y = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30]'; 
T = [X, Y]; 


