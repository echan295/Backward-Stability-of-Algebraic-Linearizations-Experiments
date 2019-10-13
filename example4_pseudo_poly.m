load example4.mat

x = linspace(-1.5, 1.5, 1000);
y = linspace(-0.8, 0.8, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*evalMPolyBernstein(A, Z)*d*evalMPolyBernstein(B, Z) + c));
    end
end

contour(x, y, z, linspace(0.01, 4, 35), 'showText', 'On');