load example5.mat

x = linspace(-3, 6, 1000);
y = linspace(-3, 3, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*evalMPolyBernstein(A, Z)*d*evalMPolyBernstein(B, Z) + c));
    end
end

contour(x, y, z, logspace(-4, 6, 40));
colormap(jet)
colorbar