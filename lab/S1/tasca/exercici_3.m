[x, y] = meshgrid(-15:1:15);
z = -(x.^2+y.^2)/75 + 2;

%fem que els punts on z és negativa siguin 0
z(z<0) = 0;

%pintem el plot
surf(x,y,z);
colormap hot;
A