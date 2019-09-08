function void = dperc(A, xmin, ymin)
[lx, ly, dir] = size(A);

for j = 1:lx
    for k = 1:ly
        if A(j, k, 1) == 1
            plot([k+xmin-1; k+xmin],[j+ymin-1; j+ymin-1], 'r'); hold on;
        end
    end
end
for j = 1:lx
    for k = 1:ly
        if A(j, k, 2) == 1
            plot([k+xmin-1; k+xmin-1],[j+ymin-1; j+ymin], 'r'); hold on;
        end
    end
end
hold off;
end
