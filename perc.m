function [A, ratio] = perc(xmin, ymin, xmax, ymax, p)
%tic;
n = xmax - xmin + 1;
m = ymax - ymin + 1;
A = ones(n,m,3);    % setting the dimensions of the 3D matrix

%{
A(:,:,1) : connection of a point to the site on the right (1 or 0)
A(:,:,2) : connection of a point to the site above  (1 or 0)
A(:,:,3) : number of connections (0-4)
%}

for i = 2:m
    for j = 1:n
        A(j,i,1) = ( rand < p );
    end
end

for i = 1:m
    for j = 2:n
        A(j,i,2) = ( rand < p );
    end
end
for i = 2:m
    for j = 2:n
        A(j,i,3) = A(j,i,1) + A(j,i,2) + A(j,i-1,1) + A(j-1,i,2);
    end
end

a1 = sum(sum(A(:,:,1)));
a2 = sum(sum(A(:,:,2)));
ratio = (a1+a1)/(n*m*2);
%toc;
end
