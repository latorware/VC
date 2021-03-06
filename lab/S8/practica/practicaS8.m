
%% PROVA AMB IMATGE AMPLIADA
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


%{
%% PROVA AMB IMATGE DEFORMADA 1
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





i = rgb2gray(imread('Joc_de_caracters_deformats.jpg')); 
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
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}



%{
%% PROVA 1 AMB IMATGE DEFORMADA 2
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





i = rgb2gray(imread('Joc_de_caracters_deformats_II.png')); 
figure
imshow(i); 

IB = i < 128; 
figure
imshow(IB); 

%IMOPEN NECESSARI SINO DETECTA MES DE 30 OBJECTES
a = strel('disk', 5); 
IB = imopen(IB, a); 
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
%}

%{
%% PROVA 2 AMB IMATGE DEFORMADA 2 (TREIENT ALGUNS DESCRIPTORS)
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

X = [ C2 C3 C4 C5 C6   C9 ]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 





i = rgb2gray(imread('Joc_de_caracters_deformats_II.png')); 
figure
imshow(i); 

IB = i < 128; 
figure
imshow(IB); 

%IMOPEN NECESSARI SINO DETECTA MES DE 30 OBJECTES
a = strel('disk', 5); 
IB = imopen(IB, a); 
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
X = [ C2 C3 C4 C5 C6   C9 ]; 
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}

%{
%% PROVA MATRICULA 1 (amb totes caracteristiques com al principi)
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





i = rgb2gray(imread('matricula_1.jpg')); 
figure
imshow(i); 

%Per colors homohenis
a = strel('disk', 128); 
i = imtophat(i, a); 
figure
imshow(i);

IB = i < 100; 
figure
imshow(IB); 

%IMOPEN 
a = strel('disk', 5); 
IB = imopen(IB, a); 
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
L = cell2mat(label); 
N = ['4'; '1'; '3'; '0'; 'D'; 'V'; 'M'];
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}




%{
%% PROVA MATRICULA 2 (amb totes caracteristiques com al principi)
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





i = rgb2gray(imread('matricula_2.jpg')); 
figure
imshow(i); 

%Per colors homohenis
a = strel('disk', 1000); 
i = imtophat(i, a); 
figure
imshow(i);

IB = i < 100; 
figure
imshow(IB); 

%IMOPEN 
a = strel('disk', 10); 
IB = imopen(IB, a); 
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
L = cell2mat(label); 
N = ['7'; '5'; '3'; '7'; 'F'; 'S'; 'N'];
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}



%{
%% PROVA MATRICULA 1 (amb caracteristiques tretes com deforme 2)
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

X = [ C2 C3 C4 C5 C6   C9 ]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 





i = rgb2gray(imread('matricula_1.jpg')); 
figure
imshow(i); 

%Per colors homohenis
a = strel('disk', 128); 
i = imtophat(i, a); 
figure
imshow(i);

IB = i < 100; 
figure
imshow(IB); 

%IMOPEN 
a = strel('disk', 5); 
IB = imopen(IB, a); 
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
X = [ C2 C3 C4 C5 C6   C9 ]; 
[label, score] = predict(Mdl, X);
L = cell2mat(label); 
N = ['4'; '1'; '3'; '0'; 'D'; 'V'; 'M'];
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}



%{
%% PROVA MATRICULA 2 (amb caracteristiques tretes com deforme 2)
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

X = [ C2 C3 C4 C5 C6   C9 ]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 





i = rgb2gray(imread('matricula_2.jpg')); 
figure
imshow(i); 

%Per colors homohenis
a = strel('disk', 1000); 
i = imtophat(i, a); 
figure
imshow(i);

IB = i < 100; 
figure
imshow(IB); 

%IMOPEN 
a = strel('disk', 10); 
IB = imopen(IB, a); 
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
X = [ C2 C3 C4 C5 C6   C9 ]; 
[label, score] = predict(Mdl, X);
L = cell2mat(label); 
N = ['7'; '5'; '3'; '7'; 'F'; 'S'; 'N'];
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}



%{
%% PROVA MATRICULA 1 (amb entrenament de la normal, ampliada i les deformades)
i = rgb2gray(imread('joc_de_caracters.jpg')); 
figure
imshow(i); 
IB = i < 128; 
figure
imshow(IB); 

ii = rgb2gray(imread('joc_de_caracters.jpg')); 
ii = imresize(ii, 2); 
IIB = ii < 128; 
figure
imshow(IIB); 

iii = rgb2gray(imread('Joc_de_caracters_deformats.jpg')); 
figure
imshow(iii); 
IIIB = iii < 128; 
figure
imshow(IIIB); 

iiii = rgb2gray(imread('Joc_de_caracters_deformats_II.png')); 
figure
imshow(iiii); 
IIIIB = iiii < 128; 
figure
imshow(IIIIB); 
a = strel('disk', 5); 
IIIIB = imopen(IIIIB, a); 
figure
imshow(IIIIB);


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

CC2 = bwconncomp(IIB); 
prop2 = regionprops('table', CC2, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C21 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C22 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C23 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C24 = prop.FilledArea ./ prop.Area; 
C25 = prop.EulerNumber; 
C26 = prop.Eccentricity;
C27 = prop.Solidity; 
C28 = prop.Extent; 
C29 = prop.MaxFeretAngle; 
C210 = prop.MinFeretAngle; 

CC3 = bwconncomp(IIIB); 
prop3 = regionprops('table', CC3, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C31 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C32 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C33 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C34 = prop.FilledArea ./ prop.Area; 
C35 = prop.EulerNumber; 
C36 = prop.Eccentricity;
C37 = prop.Solidity; 
C38 = prop.Extent; 
C39 = prop.MaxFeretAngle; 
C310 = prop.MinFeretAngle; 

CC4 = bwconncomp(IIIIB); 
prop4 = regionprops('table', CC4, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C41 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C42 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C43 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C44 = prop.FilledArea ./ prop.Area; 
C45 = prop.EulerNumber; 
C46 = prop.Eccentricity;
C47 = prop.Solidity; 
C48 = prop.Extent; 
C49 = prop.MaxFeretAngle; 
C410 = prop.MinFeretAngle; 

C1 = [C1; C21; C31; C41]; 
C2 = [C2; C22; C32; C42]; 
C3 = [C3; C23; C33; C43]; 
C4 = [C4; C24; C34; C44]; 
C5 = [C5; C25; C35; C45]; 
C6 = [C6; C26; C36; C46]; 
C7 = [C7; C27; C37; C47]; 
C8 = [C8; C28; C38; C48]; 
C9 = [C9; C29; C39; C49]; 
C10 = [C10; C210; C310; C410]; 

X = [C1 C2 C3 C4 C5 C6 C7 C8 C9 C10]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'; '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'; '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'; '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];
Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(Y == L)  %Quantes son igual
figure
confusionchart(Y, L); 



i = rgb2gray(imread('matricula_1.jpg')); 
figure
imshow(i); 

%Per colors homohenis
a = strel('disk', 128); 
i = imtophat(i, a); 
figure
imshow(i);

IB = i < 100; 
figure
imshow(IB); 

%IMOPEN 
a = strel('disk', 5); 
IB = imopen(IB, a); 
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
L = cell2mat(label); 
N = ['4'; '1'; '3'; '0'; 'D'; 'V'; 'M'];
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 
%}


%{

%% PROVA MATRICULA 2 (amb entrenament de la normal, ampliada i les deformades)
i = rgb2gray(imread('joc_de_caracters.jpg')); 
figure
imshow(i); 
IB = i < 128; 
figure
imshow(IB); 

ii = rgb2gray(imread('joc_de_caracters.jpg')); 
ii = imresize(ii, 2); 
IIB = ii < 128; 
figure
imshow(IIB); 

iii = rgb2gray(imread('Joc_de_caracters_deformats.jpg')); 
figure
imshow(iii); 
IIIB = iii < 128; 
figure
imshow(IIIB); 

iiii = rgb2gray(imread('Joc_de_caracters_deformats_II.png')); 
figure
imshow(iiii); 
IIIIB = iiii < 128; 
figure
imshow(IIIIB); 
a = strel('disk', 5); 
IIIIB = imopen(IIIIB, a); 
figure
imshow(IIIIB);


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

CC2 = bwconncomp(IIB); 
prop2 = regionprops('table', CC2, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C21 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C22 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C23 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C24 = prop.FilledArea ./ prop.Area; 
C25 = prop.EulerNumber; 
C26 = prop.Eccentricity;
C27 = prop.Solidity; 
C28 = prop.Extent; 
C29 = prop.MaxFeretAngle; 
C210 = prop.MinFeretAngle; 

CC3 = bwconncomp(IIIB); 
prop3 = regionprops('table', CC3, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C31 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C32 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C33 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C34 = prop.FilledArea ./ prop.Area; 
C35 = prop.EulerNumber; 
C36 = prop.Eccentricity;
C37 = prop.Solidity; 
C38 = prop.Extent; 
C39 = prop.MaxFeretAngle; 
C310 = prop.MinFeretAngle; 

CC4 = bwconncomp(IIIIB); 
prop4 = regionprops('table', CC4, 'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Extent', 'Eccentricity', 'FilledArea', 'MaxFeretProperties', 'MinFeretProperties', 'Solidity'); 
C41 = prop.Area ./ (prop.Perimeter .* prop.Perimeter); 
C42 = prop.Perimeter ./ prop.BoundingBox(:,3); 
C43 = prop.BoundingBox(:, 3) ./ prop.BoundingBox(:,4); 
C44 = prop.FilledArea ./ prop.Area; 
C45 = prop.EulerNumber; 
C46 = prop.Eccentricity;
C47 = prop.Solidity; 
C48 = prop.Extent; 
C49 = prop.MaxFeretAngle; 
C410 = prop.MinFeretAngle; 

C1 = [C1; C21; C31; C41]; 
C2 = [C2; C22; C32; C42]; 
C3 = [C3; C23; C33; C43]; 
C4 = [C4; C24; C34; C44]; 
C5 = [C5; C25; C35; C45]; 
C6 = [C6; C26; C36; C46]; 
C7 = [C7; C27; C37; C47]; 
C8 = [C8; C28; C38; C48]; 
C9 = [C9; C29; C39; C49]; 
C10 = [C10; C210; C310; C410]; 

X = [C1 C2 C3 C4 C5 C6 C7 C8 C9 C10]; 
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'; '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'; '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'; '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];
Mdl = TreeBagger(100, X, Y); %classificador
[label, score] = predict(Mdl, X);
N = cell2mat(Mdl.ClassNames); 
L = cell2mat(label); 
sum(Y == L)  %Quantes son igual
figure
confusionchart(Y, L); 


i = rgb2gray(imread('matricula_2.jpg')); 
figure
imshow(i); 

%Per colors homohenis
a = strel('disk', 1000); 
i = imtophat(i, a); 
figure
imshow(i);

IB = i < 100; 
figure
imshow(IB); 

%IMOPEN 
a = strel('disk', 10); 
IB = imopen(IB, a); 
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
L = cell2mat(label); 
N = ['7'; '5'; '3'; '7'; 'F'; 'S'; 'N'];
sum(N == L)  %Quantes son igual
figure
confusionchart(N, L); 


%}

%app classification learner
%{
Y = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30]'; 
T = [X, Y]; 
%}


