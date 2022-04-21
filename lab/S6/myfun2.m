function [y] = myfun2(x, k)
%y = mean(x, 'all') > k;  %binaritzacio global
%binaritzacio local
m = mean(x, 'all');
[f, c] = size(x);
cf = round(f/2);
cc = round(c/2); 

B = x(cf, cc) > m + k; % es brillant
F = x(cf, cc) < m - k; % es fosc

y = int8(B) - int8(F); 
end
