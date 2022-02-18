clear
clc
close all

%% apartat A
A_vector1 = [5 4 3 2 1];
A_vector2 = [1; 1; 1];
% Multiplicant directament els vectors
A_MultDirecte = A_vector2*A_vector1
% Multiplicant-los component a component
A_MultComponent = A_vector2.*A_vector1

%% apartat B
B_vector1 = [1 1 1]; 
B_vector2 = [-2;-1;0]; 
% Multiplicant directament els vectors
B_MultDirecte = B_vector2*B_vector1
% Multiplicant-los component a component
B_MultComponent = B_vector2.*B_vector1