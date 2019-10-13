load example3.mat

x = linspace(-7, 1, 1000);
y = linspace(-8, 8, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*evalMPoly(A, Z)*d*evalMPoly(B, Z) + c));
    end
end

contour(x, y, z, logspace(-3, 4, 20))