%Investigate 3D plotting in Matlab
clear
clc
close all


%BASIC 2D plot
x = [1, 2]; %coordenades x de tots els punts
y = [2, 3]; %coordenades y de tots els punts

figure
plot(x, y) 
xlabel('x')
ylabel('y')
grid on

%% 3D LINES
%BASIC 3D plot
z = [1 3]; 

figure
plot3(x, y, z)
xlabel('x')
ylabel('y')
zlabel('z')
grid on


%ELIPSE (amb axis equal)
t = linspace(0, 6*pi, 30); 
x = 3*cos(t); 
y = 1*sin(t); 
z = 0.01*t.^2; 

figure
plot3(x,y,z)
ylabel('x')
ylabel('y')
zlabel('z')
grid on
axis('equal')

%ELISPSe amb scatter plot a sobre

figure
hold on             %diversos plots en un
plot3(x,y,z)
plot3(x,y,z, 'mo')  %mateix que scatter3(x, y, z)   m es magenta, o ES ELS PUNTS igual que el plot scatter
ylabel('x')
ylabel('y')
zlabel('z')
grid on
axis('equal')


%% 3d SURFACES
%Patch (triangles)
x = [1 2 5];
y = [2 3 4];
z = [1 3 0]; 
figure
patch(x, y, z, 'm')


%mesh
x1 = linspace(-pi, pi, 20); 
x2 = linspace(-10, 16, 30); 

[X1, X2] = meshgrid(x1, x2); %X1 X2 tenen matrius de producte cartesia

Z = cos(X1).*X2; 

figure
mesh(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on
title('Using the ''mesh'' function')


%surf (mesh pero no transparent)
figure
surf(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on
title('Using the ''surf'' function')
shading interp  %gets rid of black lines in the surface plot
colormap winter
colorbar


%contour (visio 2D del plot 3D)
figure
contour(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on
title('Using the ''contour'' function')


%surfc (surf i contour junts)
figure
surfc(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on
title('Using the ''surfc'' function')
shading interp  %gets rid of black lines in the surface plot
colormap winter
colorbar


%composite plot
x1_line = linspace(-1,1,20); 
x2_line = linspace(0,10,20); 
z_line = cos(x1_line).*x2_line; 

figure
hold on
surfc(X1, X2, Z)
plot3(x1_line, x2_line, z_line, 'm')
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on
title('A composite plot')
shading interp  %gets rid of black lines in the surface plot
colormap winter
colorbar

