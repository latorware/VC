P1 = [rand(100, 2)*0.75+ones(100,2)]; 
P2 = [rand(100, 2)*0.5-ones(100,2)]; 
O = [P1; P2];
figure
plot(O(:,1), O(:, 2), '.'); 
L = kmeans(O, 2); 
figure
plot(O(L==1,1), O(L==1,2), 'r.'); hold
plot(O(L==2,1), O(L==2,2), 'b.');