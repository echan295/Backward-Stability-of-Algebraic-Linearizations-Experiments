M{1} = [14 25; 76 66;];
M{2} = [1884 6871; 1569 5662;];
M{3} = [7746 -10988; 7612 -4094;];
M{4} = [-14998 11091; -7788 7198;];
M{5} = [19416 -5884; 3252 -2404;];
M{6} = [-8116 5326; 1908 -1796;];

[C0, C1, X, Y] = companionMatrix(M);

% plot(eig(C0, C1), 'k.');

x = linspace(-3, 6, 1000);
y = linspace(-3, 3, 1000);

[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*C1 - C0));
    end
end

contour(x, y, z, linspace(0.01, 1, 15))
