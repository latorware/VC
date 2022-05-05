%{
i = rgb2gray(imread('joc_de_caracters.jpg')); 
figure
imshow(i); 

IB = i < 128; 
figure
imshow(IB); 

CC = bwconncomp(IB); 
prop = regionprops('table', CC, 'Area', 'BoundingBox', 'Perimeter'); 
C1 = prop.Area; 
C2 = prop.Perimeter; 
C3 = prop.BoundingBox(:, 3); %amplada
C4 = prop.BoundingBox(:, 4); %alçada

X = [C1 C2 C3 C4]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual


%Comprovar canviant imatge (surt malament perque es invariant al zoom)
i = rgb2gray(imread('joc_de_caracters.jpg')); 
i = imresize(i, 2); 
IB = i < 128; 
figure
imshow(IB); 

CC = bwconncomp(IB); 
prop = regionprops('table', CC, 'Area', 'BoundingBox', 'Perimeter'); 
C1 = prop.Area; 
C2 = prop.Perimeter; 
C3 = prop.BoundingBox(:, 3); %amplada
C4 = prop.BoundingBox(:, 4); %alçada
X = [C1 C2 C3 C4]; 
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
%}


%fem-ho variant al zoom
i = rgb2gray(imread('joc_de_caracters.jpg')); 
figure
imshow(i); 

IB = i < 128; 
figure
imshow(IB); 

CC = bwconncomp(IB); 
prop = regionprops('table', CC, 'Area', 'BoundingBox', 'Perimeter'); 
C1 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C2 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C3 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C4 = prop.BoundingBox(:, 4) ./ prop.BoundingBox(:,3);

X = [C1 C2 C3 C4]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 


%Comprovar canviant imatge (ara millor)
i = rgb2gray(imread('joc_de_caracters.jpg')); 
i = imresize(i, 2); 
IB = i < 128; 
figure
imshow(IB); 

CC = bwconncomp(IB); 
prop = regionprops('table', CC, 'Area', 'BoundingBox', 'Perimeter'); 
C1 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C2 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C3 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C4 = prop.BoundingBox(:, 4) ./ prop.BoundingBox(:,3);
X = [C1 C2 C3 C4]; 
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 

%app classification learner
Y = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30]'; 
T = [X, Y]; 

%{
%amb mes d'una imatge
T = [T; X Y]; 
Mdl = TreeBagger(100, T(:,1:4), T(:,5)); 
[label, score] = predict(Mdl, X); 
confusionchart(T(:,5),cell2mat(label)); 
%}


