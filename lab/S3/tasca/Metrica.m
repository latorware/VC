function [m] = Metrica(A)
%% INPUT HA DE SER IMATGE SOBEL

%% VERSIO 1.0
%{
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
%}

%% VERSIO 2.0 (debug version, no optimitzada)
m = 0.0; % merit de lenfoc
M = zeros(size(A,1),size(A,2)); % per comprovar importancia pixels segons distancia
enf = zeros(size(A,1), size(A,2)); % per comprovar lenfocament dels pixels
finalx = size(A, 2); % total columnes imatge
finaly = size(A, 1); % total files imatge
centrex = finalx/2.0; % posicio x centre imatge
centrey = finaly/2.0; % posicio y centre imatge
maxDist = sqrt((finalx^2) + (finaly^2))/2.0; % distancia centre imatge als extrems diagonals

for i = 1:finalx % iterem per les columnes de la imatge
    for j = 1:finaly % iterem pixels per totes les files de la columna actual
        distActual = sqrt( ((i-centrex)^2) + ((j-centrey)^2) ); % distancia pixel actual respecte el centre
        M(i,j) = 1 - (distActual/maxDist);% calculem importancia pixel actual
        %% Pixel central és el que té més importància (valor 1), pixels extrems diagonals
        %% els que tenen menys (valor 0)
        enf(i,j) = A(i,j)/255; % calculem percenatge (0 a 1) d'enfocament del pixel actual
        %% Pixel perfectament enfocat és aquell que té valor 255 a sobel
        %% Pixel que no esta gens enfocat es aquell que té valor 0 a sobel
        m = m + (M(i,j)* enf(i,j)); % calculem contribucio que fa el pixel actual al merit total d'enfoc
        % de la imatge
    end
end
end





