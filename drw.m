function void = drw(B)
[a, n] = size(B);
for i = 1:(n-1)
    plotcol = [ i/(n-1) 0 0];
    plot([B(1,i);B(1,i+1)], [B(2,i);B(2,i+1)], 'Color', plotcol); hold on;
end
hold off;
end
