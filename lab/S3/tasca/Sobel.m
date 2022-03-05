function [MatriuFiltrada] = Sobel(MatriuAFiltrar)
    h = fspecial('sobel');
    GH = abs(imfilter(MatriuAFiltrar,h)); 
    GV = abs(imfilter(MatriuAFiltrar,h'));
    MatriuFiltrada = GH + GV;
end