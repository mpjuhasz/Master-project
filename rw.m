function B = rw(A, xmin, ymin, n, beta)
%tic;
B = zeros(2, n);
x = 0;
y = 0;
a = abs(xmin)+1;
b = abs(ymin)+1;

for i = 2:n
    rn = rand;
    len = A(y+b,x+a,3);
    if A(y+b, x+a, 1) == 1
        r = beta/(beta + len - 1)*A(y+b,x+a,1);
        u = 1/(beta + len - 1)*A(y+b,x+a,2);
        l = 1/(beta + len - 1)*A(y+b, x+a-1,1);
        d = 1/(beta + len - 1)*A(y+b-1, x+a,2);
        if rn < r
            B(:,i) = [x+1;y];
            x = x+1;
        elseif rn < u + r
            B(:,i) = [x;y+1];
            y = y+1;
        elseif rn < u + r + l
            B(:,i) = [x-1;y];
            x = x-1;
        elseif rn < u + r + l + d
            B(:,i) = [x;y-1];
            y = y-1;
        end
    else 
        u = 1/(len)*A(y+b,x+a,2);
        l = 1/(len)*A(y+b, x+a-1,1);
        d = 1/(len)*A(y+b-1, x+a,2);
        if rn < u
            B(:,i) = [x;y+1];
            y = y+1;
        elseif rn < u + l
            B(:,i) = [x-1;y];
            x = x-1;
        elseif rn < u + l + d
            B(:,i) = [x;y-1];
            y = y-1;
        end
    end
end
%toc;
end


