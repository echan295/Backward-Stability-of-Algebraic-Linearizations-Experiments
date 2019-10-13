load example1.mat

c = eye(3);
d = eye(3);

M = ALMultCoeff(A, B, c, d);

[C0, C1, X, Y] = companionMatrix(M);

% plot(eig(C0, C1), 'k.');

x = linspace(-4, 3, 1000);
y = linspace(-2, 2, 1000);

[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        z(i, j) = min(svd((x(i, j) + 1i*y(i, j))*C1 - C0));
    end
end

colormap(jet);
contour(x, y, z, linspace(0.05, 0.4, 10))
