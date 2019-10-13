load example2.mat

[C0, C1, X, Y] = algebraicLinearization(A, B, c, d);

% E = eig(C0, C1);
% plot(E, 'k.');

x = linspace(-4, 12, 4000);
y = linspace(-2.5, 2.5, 1000);
[x, y] = meshgrid(x, y);
z = zeros(1000, 4000);

for i = 1:1000
    for j = 1:4000
        z(i, j) = min(svd((x(i, j) + 1i*y(i, j))*C1 - C0));
    end
end

contour(x, y, z, logspace(-3, 4, 10), 'showText', 'On');