load example6.mat

x = linspace(-4, 3, 1000);
y = linspace(-0.6, 0.6, 1000);

[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*lagrange(Atau, Arho, Z)*d*lagrange(Btau, Brho, Z) + c));
    end
end

contour(x, y, z, logspace(-3, 3, 30), 'showText', 'On')