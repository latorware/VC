function [m] = Metrica(A)
m = 0.0;
M = zeros(size(A,1),size(A,2));
llindar = max(max(A))*0.98;
inici = 1;
finalx = size(A,1);
finaly = size(A,2);
while finalx >= inici && finaly >= inici
    pond = inici/round(min(size(A,1),size(A,2))/2);
    for i = inici:finalx
        if A(i,inici) > llindar
            m = m+ double(A(i,inici)*pond);
        end
        if inici ~= finaly && A(i,finaly) > llindar
            m= m+ double(A(i,finaly)*pond);
        end
        M(i,inici) =pond;
        M(i,finaly) = pond;
    end

    for j = inici+1:finaly-1
        if A(inici,j) > llindar 
            m = m + double(A(inici,j)*pond);
        end
        if inici ~= finalx && A(finalx,j) > llindar
            m = m + double(A(finalx,j)*pond);
        end
        M(inici, j) = pond;
        M(finalx, j) = pond;
    end
    inici = inici +1;
    finalx = finalx -1;
    finaly = finaly -1;
end