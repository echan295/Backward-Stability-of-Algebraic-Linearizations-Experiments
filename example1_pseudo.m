load example1.mat

[C0, C1, X, Y] = algebraicLinearization(A, B, c, d);

x = linspace(-4, 3, 1000);
y = linspace(-2, 2, 1000);

[x, y] = meshgrid(x, y);

z = zeros(1000, 1000);

for i = 1:1000
    for j = 1:1000
        z(i, j) = min(svd((x(i, j) + 1i*y(i, j))*C1 - C0));
    end
end

colormap(jet);
contour(x, y, z, linspace(0.05, 0.4, 10))
% shading interp;
% caxis manual
% caxis([0.05, 0.4]);