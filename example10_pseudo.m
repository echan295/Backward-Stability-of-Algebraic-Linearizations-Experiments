load example10.mat

[c0a, c1a, xa, ya] = algebraicLinearization(A, B, cab, d);
[c0b, c1b, xb, yb] = algebraicLinearization(C, D, ccd, d);

[C0, C1, X, Y] = CalgebraicLinearization(c0a, c1a, xa, ya, c0b, c1b, xb, yb, cabcd, d);

% plot(eig(C0, C1), 'k.')

x = linspace(-1.5, 1.5, 1000);
y = linspace(-1.5, 1.5, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*C1 - C0));
    end
end

contour(x, y, z, logspace(-3, 2, 20))