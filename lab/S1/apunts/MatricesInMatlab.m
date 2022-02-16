%Matrices in Matlab
clear
clc
close all


%Define a matrix
A = [2 4 6; 8 10 12]; 

B = [11 9;
    7 5;
    3, 1]; 

C = [1 2 3; 
    4 5 6; 
    7 8 9];


%Matrix multiplication
A*B; 
B*A; 

time        = [0.5  0.7  0.5  1.1  2.0]; 
velocity    = [15   16   18   15   14]; 

        %EL QUE NO HI HA PUNT I COMA ES EL QUE ES simprimeix a command line

distance = time.*velocity;  %element wise. No es multiplicacio de les matrius
V = distance./time;


%EXTRACTION 
    %Single element extraction
C_12 = C(1, 2); 
C_13 = C(1, end); 

    %Entire row/column extraction
column2 = C(:, 2); 
row3 = C(3, :); 

    %Sunmatrix extraction
bottomLeftSubMatrix = C(2:3, 1:2); 


%Transpose
D = [1 2 3 4 5]; 
DT = D'; 


%Concatenate
row1 = [1 2 3 4 ]; 
row2 = [5, 6, 7, 8]; 

E = [row1;
    row2]; 

col1 = [1;2;3]; 
col2 = [4;5;6]; 

F = [col1 col2]; 


%Helpful built-in functions
zeroMatrix = zeros(4, 6); 
onesMatrix = ones(4, 6); 
identityMatrix = eye(5); 
diagonalMatrix = diag([1 2 3 4 5]); 
randomMatrix = rand(3, 4); 


%inearly spaced vectors
linearlySpaced1 = [3:0.25:6]; %de 3 a 6 amb espai 0.25
linearlySpaced2 = linspace(3, 6, 15); %15 valors de 3 fins a 6


%Finding the dimensions of existing matrices and vectors
length(linearlySpaced2) %VECTOR

test = rand(4, 17); 
[numRows, numCols] = size(test); %MATRIX


