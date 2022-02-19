[x y] = meshgrid(-15:1:15);
z = -(x.^2+y.^2)/400 + 0.5;
z(z<0) = 0;
surf(x,y,z);
colormap hot;
