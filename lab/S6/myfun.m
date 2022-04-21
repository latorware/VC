function [y] = myfun(x, k)
%y = mean(x, 'all') > k;  %binaritzacio global
%binaritzacio local
m = mean(x, 'all');
[f, c] = size(x);
cf = round(f/2);
cc = round(c/2); 
y = x(cf,cc) > m; 
end

