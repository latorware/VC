function [y] = mycontrast(x)
y = uint8(255*(1-exp(- 5*double(x)/128))); 
end

