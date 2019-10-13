load example5.mat

[c0a, c1a, xa, ya] = companionMatrix(A, 'basis', 'Bernstein');
[c0b, c1b, xb, yb] = companionMatrix(B, 'basis', 'Bernstein');

[C0, C1, X, Y] = CalgebraicLinearization(c0a, c1a, xa, ya, c0b, c1b, xb, yb, c, d);

% plot(eig(C0, C1), 'k.')

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

contour(x, y, z, linspace(0.01, 1, 15), 'showText', 'On')
