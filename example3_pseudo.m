load example3.mat

[C0, C1, X, Y] = algebraicLinearization(A, B, c, d);

x = linspace(-7, 1, 1000);
y = linspace(-8, 8, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*C1 - C0));
    end
end

contour(x, y, z, linspace(1e-4, 0.4, 15));