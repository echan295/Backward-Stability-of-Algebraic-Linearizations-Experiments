load example1.mat

M = ALMultCoeff(A, B, c, d);
normM = cell(1, length(M));

for i = 1:length(M)
    normM{i} = norm(M{i}, 2);
end

x = linspace(-4, 3, 1000);
y = linspace(-2, 2, 1000);

[x, y] = meshgrid(x, y);

z = zeros(1000, 1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(evalMPoly(M, Z)))/evalMPoly(normM, abs(Z));
    end
end

contour(x, y, z, logspace(-4, 0, 15))