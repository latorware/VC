clear
clc
close all

x = linspace(0,6,100); 
y = cos(x).*(-1); 
y(y<0) = 0; 
[y_max, index_max] = max(y); 
x_max = x(index_max); 
figure
hold on
plot(x, y)
scatter(x_max, y_max)