% creació dels punts aleatòris en sistema de coordenades esfèric
N = 1000;
theta = 2*pi*rand(N,1);
phi = asin(2*rand(N,1)-1);
radii = 50*(rand(N,1).^(1/50));

% conversió al sistema de coordenades cartesià
[x,y,z] = sph2cart(theta, phi, radii);

%trasllat al punt central 100,100,100
x = x + 100; 
y = y + 100; 
z = z + 100; 

% plot
S = ((-radii)+50)*16.0; 
C = [zeros(N,1) zeros(N,1) (radii./50).^(50)]; 
scatter3(x, y, z, S, C, 'filled')
axis vis3d equal, grid on, box on
xlabel X, ylabel Y, zlabel Z