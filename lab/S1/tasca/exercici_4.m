%creació de la figura
[x, y] = meshgrid(-14:1:15);
za = -(x.^2+y.^2)/100 + 1.5;

%concatenació
[x2, y2] = meshgrid(1:1:60);
z = [za za; za za];

%pintem el plot
z(z<0)=0;
colormap jet;
surf(x2,y2,z);



